require 'jekyll'
require 'net/http'
require 'json'
require 'yaml'
require 'uri'

# Storm team data generator.
#
# Pulls the Storm PMC + committer roster from public ASF sources at build
# time and exposes it to Liquid templates as:
#
#   site.data.team_active     # active members (chair, then PMC, then committers)
#   site.data.team_emeritus   # everyone else in the LDAP roster
#
# Active membership is driven by _data/team.yml (`active:` list of availids
# plus an optional `chair:` override). Anyone in LDAP not listed in the
# YAML is shown as emeritus.
#
# Network sources (no auth required):
#   * https://whimsy.apache.org/public/public_ldap_projects.json — committee
#   * https://projects.apache.org/json/foundation/people.json    — names + GH
#
# Successful fetches are cached to tmp/asf_roster.yml; the cache is consulted
# only when the live fetch fails, so the build degrades gracefully if Whimsy
# or projects.apache.org is unreachable.
module StormTeam
  WHIMSY_PROJECTS_URL = 'https://whimsy.apache.org/public/public_ldap_projects.json'.freeze
  PEOPLE_JSON_URL     = 'https://projects.apache.org/json/foundation/people.json'.freeze
  CACHE_RELATIVE_PATH = 'tmp/asf_roster.yml'.freeze
  PROJECT_NAME        = 'storm'.freeze
  HTTP_TIMEOUT        = 8

  class Generator < Jekyll::Generator
    def generate(site)
      cache_path = File.join(site.source, CACHE_RELATIVE_PATH)

      committee = fetch_committee
      people    = fetch_people

      if committee.nil? || people.nil?
        cached    = load_cache(cache_path)
        committee ||= cached && cached['committee']
        people    ||= cached && cached['people']
      end

      save_cache(cache_path, committee, people) if committee && people

      yaml_team  = site.data['team'] || {}
      active_set = (yaml_team['active'] || []).map(&:to_s)
      chair_id   = (yaml_team['chair'] || (committee && committee['chair'])).to_s

      pmc_ids       = (committee && committee['owners'])  || []
      committer_ids = (committee && committee['members']) || []
      all_ids       = (pmc_ids + committer_ids + active_set + [chair_id])
                      .uniq.reject { |s| s.nil? || s.empty? }

      records = all_ids.map do |aid|
        person = people ? (people[aid] || {}) : {}
        role =
          if    aid == chair_id            then 'chair'
          elsif pmc_ids.include?(aid)      then 'pmc'
          elsif committer_ids.include?(aid) then 'committer'
          else                                  'committer'
          end
        {
          'apache_id' => aid,
          'name'      => person['name']   || aid,
          'github'    => person['github'] || aid,
          'role'      => role,
          'active'    => (aid == chair_id) || active_set.include?(aid),
        }
      end

      site.data['team_active']   = records.select { |r| r['active'] }.sort_by { |r| active_sort_key(r) }
      site.data['team_emeritus'] = records.reject { |r| r['active'] }.sort_by { |r| r['name'].to_s.downcase }

      Jekyll.logger.info 'StormTeam:',
        "active=#{site.data['team_active'].size} emeritus=#{site.data['team_emeritus'].size}"
    end

    private

    def active_sort_key(record)
      rank = { 'chair' => 0, 'pmc' => 1, 'committer' => 2 }[record['role']] || 3
      [rank, record['name'].to_s.downcase]
    end

    def fetch_committee
      data = fetch_json(WHIMSY_PROJECTS_URL)
      data && data.dig('projects', PROJECT_NAME)
    rescue StandardError => e
      Jekyll.logger.warn 'StormTeam:', "Whimsy fetch failed: #{e.message}"
      nil
    end

    def fetch_people
      data = fetch_json(PEOPLE_JSON_URL)
      return nil unless data.is_a?(Hash)

      data.each_with_object({}) do |(aid, rec), out|
        next unless rec.is_a?(Hash)
        out[aid] = { 'name' => rec['name'] || aid, 'github' => extract_github(rec) }
      end
    rescue StandardError => e
      Jekyll.logger.warn 'StormTeam:', "people.json fetch failed: #{e.message}"
      nil
    end

    def extract_github(rec)
      urls = rec['urls']
      return nil unless urls.is_a?(Hash)
      raw = urls['github'] || urls['GitHub'] || urls['github.com']
      return nil unless raw.is_a?(String) && !raw.empty?
      handle = raw.sub(%r{\Ahttps?://github\.com/}, '').sub(%r{/.*\z}, '').strip
      handle.empty? ? nil : handle
    end

    def fetch_json(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl     = (uri.scheme == 'https')
      http.open_timeout = HTTP_TIMEOUT
      http.read_timeout = HTTP_TIMEOUT
      req = Net::HTTP::Get.new(uri.request_uri, 'User-Agent' => 'storm-site-team/1.0')
      res = http.request(req)
      return nil unless res.is_a?(Net::HTTPSuccess)
      JSON.parse(res.body)
    end

    def load_cache(path)
      return nil unless File.exist?(path)
      YAML.safe_load(File.read(path))
    rescue StandardError => e
      Jekyll.logger.warn 'StormTeam:', "cache read failed: #{e.message}"
      nil
    end

    def save_cache(path, committee, people)
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, { 'committee' => committee, 'people' => people }.to_yaml)
    rescue StandardError => e
      Jekyll.logger.warn 'StormTeam:', "cache write failed: #{e.message}"
    end
  end
end

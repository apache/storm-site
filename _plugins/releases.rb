module Releases
  class Generator < Jekyll::Generator
    def dir_to_releasename(dir)
      ret = nil
      splitdir = dir.split("/").select{ |a| a != ""};
      if (splitdir[0] == 'releases')
        ret = splitdir[1]
        if (ret == 'current')
          ret = File.readlink(splitdir.join("/")).split("/")[-1]
        end
      end
      return ret
    end

    def set_if_unset(hash, key, value)
      hash[key] = hash[key] || value;
    end

    def parse_version(version_string)
      return version_string.split('.').map{|e| e.to_i}
    end

    def generate(site)
      releases = Hash.new

      # Find the releases/ subdirectories, their names are the current releases
      for page in site.pages do
        release_name = dir_to_releasename(page.dir)
        if (release_name != nil)
          releases[release_name] = {'name' => release_name};
          releases[release_name]['documented'] = true
        end
      end

      # Set some metadata for each release
      releases.each { |release_name, release_data|
          set_if_unset(release_data, 'git-tag-or-branch', "v#{release_data['name']}")
          set_if_unset(release_data, 'git-tree-base', "https://github.com/apache/storm/tree/#{release_data['git-tag-or-branch']}")
          set_if_unset(release_data, 'git-blob-base', "https://github.com/apache/storm/blob/#{release_data['git-tag-or-branch']}")
          set_if_unset(release_data, 'base-name', "apache-storm-#{release_data['name']}")
          set_if_unset(release_data, 'has-download', !release_name.end_with?('-SNAPSHOT'))
      }

      # Make release metadata available to each page for release specific docs, e.g. links to source
      for page in site.pages do
        release_name = dir_to_releasename(page.dir)
        if (release_name != nil)
          release_data = releases[release_name] 
          page.data['version'] = release_name;
          page.data['git-tree-base'] = release_data['git-tree-base'];
          page.data['git-blob-base'] = release_data['git-blob-base'];
        end
      end
      site.data['releases'] = releases.values.sort{|x,y| parse_version(y['name']) <=>
                                                         parse_version(x['name'])};
    end
  end
end

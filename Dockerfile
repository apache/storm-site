FROM ruby:3.2-alpine

# Build deps for native gems (eventmachine, http_parser.rb, ffi).
# git is needed by bundler when a Gemfile sources gems from git.
RUN apk add --no-cache build-base git

ENV BUNDLE_PATH=/usr/local/bundle \
    JEKYLL_ENV=production

WORKDIR /srv/jekyll

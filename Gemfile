source 'https://rubygems.org'

# Plain Jekyll 3.10 (matches what github-pages pinned to). Avoids the ~96
# transitive gems github-pages drags in (themes, coffeescript, etc.) which
# the site does not use. Production CI deploys via GitHub Actions to ASF
# infra, not GitHub Pages, so the github-pages bundle is unnecessary.
gem "jekyll", "~> 3.10"

# Markdown engine used by _config.yml.
gem "redcarpet", "~> 3.5"

# Jekyll 3.10 expects this even when redcarpet is the configured engine
# (it was previously pulled in transitively by github-pages).
gem "kramdown-parser-gfm"

gem "webrick", "~> 1.8"

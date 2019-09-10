# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :relative_assets

activate :external_pipeline,
  name: :webpack,
  command: build? \
    ? 'env NODE_ENV=production yarn run webpack --bail --production' \
    : 'yarn run webpack --watch -d --color',
  source: 'tmp/dist',
  latency: 1

set :relative_links, true

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :development do
  set :root_url, 'http://127.0.0.1:4567'
  set :google_analytics, false
end

configure :build do
  set :root_url, 'https://fullstaqruby.org'
  set :google_analytics, true
  activate :asset_hash
end

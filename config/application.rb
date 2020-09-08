require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Spotify
  class Application < Rails::Application
    config.load_defaults 6.0
    config.paths.add Rails.root.join('lib').to_s, eager_load: true
    config.spotify = config_for('spotify/app').deep_symbolize_keys
  end
end

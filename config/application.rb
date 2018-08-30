require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'rack/throttle'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tyskpolitikk
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.i18n.available_locales = %w(nb sv en)
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components') # Bower/NPM frontend stuff

    config.middleware.use Rack::Throttle::Daily,    :max => 10000  # requests
    config.middleware.use Rack::Throttle::Hourly,   :max => 1000   # requests
    config.middleware.use Rack::Throttle::Minute,   :max => 600    # requests
    config.middleware.use Rack::Throttle::Second,   :max => 10     # requests
  end
end

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VoltTestWeb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    load_path = Rails.root.join('lib')

    if Rails.env.production?
        config.eager_load_paths << load_path
    else
        config.autoload_paths << load_path
    end

    config.auth_token_expiration_time = 30.minutes
  end
end

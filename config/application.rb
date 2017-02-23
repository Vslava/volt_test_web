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

    config.active_job.queue_adapter = :sidekiq

    load_path = Rails.root.join('lib')

    if Rails.env.production?
        config.eager_load_paths << load_path
    else
        config.autoload_paths << load_path
    end

    # config.auth_token_expiration_time = 30.minutes
    config.auth_token_expiration_time = 1.days

    config.report_from_email = ENV['FROM_EMAIL']
    config.action_mailer.smtp_settings = {
        address: ENV['SMTP_SERVER'],
        port: ENV['SMTP_PORT'],
        domain: ENV['SMTP_DOMAIN'],
        user_name: ENV['SMTP_AUTH_LOGIN'],
        password: ENV['SMTP_AUTH_PASS'],
        authentication: :plain,
        enable_starttls_auto: true
    }

    # config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
  end
end

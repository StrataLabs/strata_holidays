require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module StrataHolidays
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Mumbai'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.initialize_on_precompile = false
    # config.action_view.field_error_proc = Proc.new { |html_tag, instance|   "#{html_tag}".html_safe }
    # config.serve_static_assets = true
    config.to_prepare do
    Devise::SessionsController.layout "home"
    Devise::RegistrationsController.layout "home"
    Devise::ConfirmationsController.layout "home"
    #Devise::UnlocksController.layout "your_layout_name"
    #Devise::PasswordsController.layout "your_layout_name"
end
  end
end
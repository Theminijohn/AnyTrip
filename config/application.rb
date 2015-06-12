require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AnyTrip
  class Application < Rails::Application
    config.to_prepare do
      Devise::SessionsController.layout "devise_layout"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "devise_layout"  }
      Devise::UnlocksController.layout "devise_layout"
      Devise::PasswordsController.layout "devise_layout"
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Heroku
    config.assets.initialize_on_precompile = false

    # Custom Generators
    config.generators do |g|
      # Assets
      g.stylesheets = false
      g.javascripts = false

      # RSpec
      g.test_framework :rspec, fixtures: true,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               controller_specs: true,
                               request_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # Include Lib Folder
    config.autoload_paths << Rails.root.join('lib')
  end
end

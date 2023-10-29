require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StripeIntegration
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.stripe.publishable_key = 'pk_test_51O6PubSFOMM3gWDssVYAzYIv5IVxFn4EFkiZUyV8GWa0lzKZdbYyYAUlaA151gDOo1VFj0MSDQYNFtKePu0yER9Z00BVAdXb4b'


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

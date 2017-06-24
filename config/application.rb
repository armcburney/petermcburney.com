require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PeterMcBurney
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators do |g|
      g.template_engine :slim
    end
  end
end

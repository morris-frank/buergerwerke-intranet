require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BuergerwerkeIntranet
  class Application < Rails::Application
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    config.load_defaults 5.2

    config.site_title = 'Intranet der Bürgerwerke'
    config.i18n.default_locale = :'de'
  end
end

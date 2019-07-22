require_relative 'boot'

require 'rails'

%w[
  active_model
  active_job
  active_record
  action_controller
  action_mailer
  action_view
].each { |railtie| require "#{railtie}/railtie" }

Bundler.require(*Rails.groups)

module MoviesApi
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true
    #config.active_record.schema_format = :sql
    config.i18n.default_locale = :en
    config.active_job.queue_adapter = :sidekiq
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('lib', 'validators')
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.orm :active_record, foreign_key_type: :uuid
    end
  end
end

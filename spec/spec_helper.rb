ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.backtrace_exclusion_patterns << /database_cleaner/
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  #config.example_status_persistence_file_path = 'spec/examples.txt'
  config.raise_errors_for_deprecations!
  config.default_formatter = :doc if config.files_to_run.one?
  config.verbose_retry = true
  config.display_try_failure_messages = true
  config.default_retry_count = 2
  config.order = :random
  Kernel.srand(config.seed)
end

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', 'shared', '**', '*_{examples,context}.rb')].each { |file| require file }

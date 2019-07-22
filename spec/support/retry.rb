RSpec.configure do |config|
  config.around(:each) { |example| example.run_with_retry }
end

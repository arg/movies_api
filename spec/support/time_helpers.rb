RSpec.configure do |config|
  config.include ActiveSupport::Testing::TimeHelpers

  config.around(:example, freeze: true) do |example|
    travel_to(Time.current)
    example.run
    travel_back
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    DatabaseCleaner.cleaning { FactoryBot.lint(traits: true) }
  end
end

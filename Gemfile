source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '~> 1.1.0'
gem 'puma', '~> 4.0.0'
gem 'oj', '~> 3.8.0'
gem 'sidekiq', '~> 5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry', '~> 0.12.0'
  gem 'rspec-rails', '~> 3.8.0'
end

group :development do
  gem 'listen', '~> 3.1.5'
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'shoulda-matchers', '~> 4.0.0'
  gem 'database_cleaner', '~> 1.7.0'
  gem 'rspec-its', '~> 1.3.0'
  gem 'rspec-retry', '~> 0.6.0'
  gem 'faker', '~> 1.9.0'
end

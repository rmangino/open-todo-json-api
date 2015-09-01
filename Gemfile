# file: Gemfile
source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'rails-api'
gem 'sqlite3'

gem 'warden'  # Reaction Analytics

gem 'bcrypt', '~> 3.1.7'  # Needed for has_secure_token
gem 'has_secure_token'

gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'awesome_print'
  gem 'meta_request'  # Required to use Chrome's RailsPanel extension

  gem 'rspec-rails', '~> 3.0'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
end
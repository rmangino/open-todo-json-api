# file: Gemfile
source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'rails-api'
gem 'sqlite3'

gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end
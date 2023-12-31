# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', '~> 1.17', require: false
gem 'dartsass-rails', '~> 0.5'
gem 'importmap-rails', '~> 1.2'
gem 'jbuilder', ' ~> 2.11'
gem 'pg', '~> 1.5'
gem 'propshaft', '~> 0.8'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'redis', '>= 4.0.1'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails', '~> 1.3'
gem 'turbo-rails', '~> 1.5'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.1'
end

group :test do
  gem 'rails-controller-testing', '~> 1'
  gem 'simplecov', '~> 0.22', require: false
end

group :development do
  gem 'dockerfile-rails', '>= 1.5'
  gem 'rubocop', '~> 1.57'
  gem 'web-console'
end

# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'dartsass-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'redis', '>= 4.0.1'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.4'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-controller-testing', '~> 1'
  gem 'rspec-rails', '~> 6.1'
end

group :development do
  gem 'rubocop', '~> 1.57'
  gem 'web-console'
end

gem 'dockerfile-rails', '>= 1.5', group: :development

gem 'pg', '~> 1.5'

gem 'sentry-ruby', '~> 5.13'

gem 'sentry-rails', '~> 5.13'

# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootsnap', require: false
gem 'cancancan'
gem 'cssbundling-rails'
gem 'devise'
gem 'devise_invitable'
gem 'haml-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'rails-i18n', '~> 7.0.0'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'rack-mini-profiler'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

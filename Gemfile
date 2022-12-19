source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'brakeman'
gem 'bundler-audit'
gem 'cssbundling-rails'
gem 'devise'
gem 'devise_token_auth'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'pry-rails'
gem 'public_uid'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.4'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component', '~> 2.78'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'pre-commit', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'web-console'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

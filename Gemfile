source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1' # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"

gem 'bootsnap', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'importmap-rails' # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'jbuilder'
gem 'pg' # Postgresql gem
gem 'puma', '~> 5.0' # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'rails', '~> 7.0.4', '>= 7.0.4.3' # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
gem 'sprockets-rails' # Use sqlite3 as the database for Active Record
gem 'stimulus-rails' # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'turbo-rails' # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate' # Annotate ActiveRecord models 
  gem 'web-console' # Use console on exceptions pages [https://github.com/rails/web-console]
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

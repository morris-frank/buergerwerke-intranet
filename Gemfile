source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Use Puma as the app server
  gem 'puma', '~> 3.11'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  # Add passenger for Artfiles
  gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"

  # Artfiles has no node.js installed so we use the gem instead:
  gem 'mini_racer', platforms: :ruby
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# for user authentication
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'

# active admin integration
gem 'activeadmin'
gem 'arctic_admin'
gem "active_admin_import" , github: "activeadmin-plugins/active_admin_import"

# for exception notifier
gem 'exception_notification'

# bulma.io is used as the sass framework
gem 'bulma-rails', '~> 0.7.1'
# For embedding OSMaps for plants and cooperatives
gem 'leaflet-rails'

# For german translations
gem 'rails-i18n'

# For Unzipping of the customer data
gem 'rubyzip'

# To geocode plants and cooperatives addresses
gem 'geocoder'

# To generate non-digest Error pages
gem "non-digest-assets"

# For pagination of index lists
gem 'kaminari'

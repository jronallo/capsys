source 'http://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mongo_mapper'
gem 'bson_ext'
gem 'therubyracer'
gem 'formtastic'
gem 'nokogiri'
gem 'oai'

gem "thin"

gem 'anjlab-bootstrap-rails', '>= 2.0', :require => 'bootstrap-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

#gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem "nifty-generators"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'vcr'
  gem 'fakeweb'
  gem 'launchy'
end

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'ruby-debug19'
end

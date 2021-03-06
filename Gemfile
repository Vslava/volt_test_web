source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use postgresql as the database for Active Record
gem 'pg'

# ActiveModel::Serializer implementation and Rails hooks
gem 'active_model_serializers'

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard
gem 'jwt'

# A simple, standardized way to build and use Service Objects (aka Commands) in Ruby
gem 'simple_command'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator
# for modern web app frameworks and ORMs
gem 'kaminari'

# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave'

# Protection from image bombs
gem 'carrierwave-bombshelter'

# A ruby wrapper for ImageMagick or GraphicsMagick command line.
gem 'mini_magick'

gem 'fog-aws'

# Official Sass port of Bootstrap 2 and 3
gem 'bootstrap-sass'

# Slim is a template language whose goal is reduce the syntax
# to the essential parts without becoming cryptic
gem 'slim-rails'

# For ActiveJob support
gem 'sidekiq'

# A library for generating fake data such as names, addresses, and phone numbers.
gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'rspec-rails'

  # Collection of testing matchers extracted from Shoulda
  gem 'shoulda-matchers'

  # ..is a fixtures replacement with a straightforward definition syntax
  gem 'factory_girl_rails'

  # A Ruby gem to load environment variables from `.env`.
  gem 'dotenv-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

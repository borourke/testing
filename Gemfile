source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use Unicorn as the app server
gem 'unicorn'

#Serialization of objects
gem 'jbuilder'
gem 'sidekiq'
gem 'aasm'
gem 'annotate'
gem 'decent_exposure', '~>3.0.0'
gem 'aws-sdk-rails'

# monitoring
gem 'newrelic_rpm'
gem 'rollbar'

gem 'pg'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'json-schema'
  # For that ENV
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.2.0.beta1'

gem 'haml-rails'
gem 'dynamic_form'
gem 'bcrypt', '~> 3.1.7'
gem 'rails-html-sanitizer', '~> 1.0'

group :assets do
  gem 'sass-rails', '~> 5.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0'
end

group :test do
  gem 'simplecov', require: false
  gem 'rubocop',   require: false
  gem 'rubocop-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'capybara'
end

group :development do
  # gem 'capistrano-rails'
  gem 'better_errors'
  gem 'binding_of_caller', platform: :mri_21
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
end

group :development, :test do
  gem 'sqlite3'
  gem 'web-console', '~> 2.0.0.beta2'
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'rspec-activemodel-mocks'
end

group :production, :development do
  gem 'uglifier', '>= 1.3.0'
  gem 'turbolinks'
  gem 'jquery-rails'
end

group :production do
  gem 'sitemap_generator'
  gem 'carrierwave'
  gem 'rails_12factor'
  gem 'pg'
  gem 'unicorn'
end

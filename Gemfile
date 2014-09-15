source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.2.0.beta1'

gem 'slim-rails'          # patched
# gem 'haml-rails'        # deprecated
# gem 'dynamic_form'      # deprecated
gem 'bcrypt', '~> 3.1.7'
gem 'rails-html-sanitizer', '~> 1.0'

group :assets do
  gem 'sass-rails', '~> 5.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0'
end

group :test do
  gem 'factory_girl_rails' # patched
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  # gem 'capybara'         # deprecated
end

group :development do
  gem 'simplecov', require: false
  gem 'rubocop',   require: false
  gem 'rubocop-rspec'
  gem 'better_errors'
  gem 'binding_of_caller', platform: :mri_21
  gem 'guard-rspec', require: false
  gem 'guard-rubocop'
end

group :development, :test do
  gem 'sqlite3'
  # gem 'web-console', '~> 2.0.0.beta2' # deprecated
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'pry-rails'               # patched
  # gem 'byebug'                # deprecated
  gem 'rspec-rails', '~> 3.0.0'
  gem 'rspec-activemodel-mocks' # patched
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

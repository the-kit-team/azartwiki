source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.2.0.beta4'

gem 'haml-rails'
gem 'simple_form'
gem 'bcrypt', '~> 3.1.7'
gem 'rails-html-sanitizer', '~> 1.0'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootsy'

group :assets do
  gem 'sass-rails', '~> 5.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'rspec-activemodel-mocks'
end

group :development do
  gem 'simplecov',     require: false
  gem 'rubocop',       require: false
  gem 'rubocop-rspec', require: false
  gem 'rack-livereload'
  gem 'terminal-notifier-guard'

  %w(rspec rubocop bundler livereload migrate shell).each do |b|
    gem "guard-#{b}", require: false
  end
end

group :development, :test do
  gem 'sqlite3'
  gem 'web-console', '~> 2.0.0.beta4'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.1.0'
end

group :production, :development do
  gem 'turbolinks'
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.3.0'
end

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor'
  gem 'sitemap_generator'
  gem 'fog'
end

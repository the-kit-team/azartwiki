# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  # config.include FactoryGirl::Syntax::Methods
  # config.include Capybara::DSL

  config.raise_errors_for_deprecations!

  config.infer_spec_type_from_file_location!

  config.order = 'random'
end

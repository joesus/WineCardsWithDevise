require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

config.fixture_path = "#{::Rails.root}/spec/fixtures"

config.use_transactional_fixtures = true

config.infer_base_class_for_anonymous_controllers = false

config.include Devise::TestHelpers, :type => :controller

config.include Rails.application.routes.url_helpers

config.order = "random"

config.include Capybara::DSL

  end
end

Spork.each_run do
  
end

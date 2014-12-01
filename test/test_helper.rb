if ENV["COVERAGE"] == "1"
  require 'simplecov' # simple-cov
  SimpleCov.coverage_dir('test/coverage')
  SimpleCov.start 'rails'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'lib/simple_verifiers'

class ActiveSupport::TestCase
  include SimpleVerifiers
end

def parse_in file
  eval(File.read(file))
end

Capybara.register_driver :firefox_driver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox,
    :profile => 'name_of_existing_profile')
end
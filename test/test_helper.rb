if ENV["COVERAGE"] == "1"
  require 'simplecov' # simple-cov
  SimpleCov.coverage_dir('test/coverage')
  SimpleCov.start 'rails'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'lib/simple_verifiers'
require 'lib/odds_ends'

class ActiveSupport::TestCase
  #fixtures :all
  include SimpleVerifiers
  include OddsEnds
end

def parse_in file
  eval(File.read(file))
end

def check_datum_properties method_name
  assert @datum, "Datum is nil"
  m, i = Datum.parse_test_name(@datum.datum_test_method)
  assert_equal method_name.to_s, m
  assert_equal @datum.datum_id, (i + 1)
end

Capybara.register_driver :firefox_driver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox,
    :profile => 'name_of_existing_profile')
end


##ActiveRecord::SchemaDumper.ignore_tables = ['foo_table', 'bar_table']
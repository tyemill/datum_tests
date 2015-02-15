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

def parse_in file, bind
  eval(File.read(file), bind)
end

## method_name: the name of the data_method - __method__
## expected: the count of expected iterations
def check_datum_properties method_name, expected
  validate_datum @datum, method_name
  validate_container method_name, expected
end

def validate_datum datum, method_name, complete = false
  assert_not_nil datum, "datum is nil"
  assert_not_nil datum.datum_id, "datum.datum_id is nil"
  assert_not_nil datum.test_method_name, "datum.test_method_name is nil"
  method_index = ::Datum::Helpers.index_from_test_name datum.test_method_name
  assert_equal method_index, datum.datum_id
  data_method = ::Datum::Helpers.data_method_from_test_name datum.test_method_name
  assert_equal method_name.to_s, data_method
end

def validate_container method_name, expected
  con = @datum.container
  assert_not_nil con, "@datum.container is nil"
  assert_not_nil con.data, "datum.container.data is nil"
  assert con.length != 0, "datum.container.length is 0"
  assert con.count != 0, "datum.container.length is 0"
  assert con.size != 0, "datum.container.length is 0"
  assert con.test_count != 0, "datum.container.test_count is 0"
  assert_equal method_name.to_s, con.data_method_name
  assert_equal self.class, con.test_instance
  assert_equal con.length, con.data.length
  assert_equal con.count, con.data.length
  assert_equal con.size, con.data.length
  assert_equal con.test_count, con.data.length

  if @datum.datum_id == con.count # last test
    assert_equal expected, @datum.datum_id
    assert_equal expected, con.data.length, "data length"
    assert_equal expected, con.length, "container length"
    assert_equal expected, con.count, "container count"
    assert_equal expected, con.size, "container size"
    assert_equal expected, con.test_count, "container test_count"
    con.data.each_pair do |k, d|
      validate_datum d, method_name, d.datum_id != con.count
      #assert ::Datum.loaded_data.has_value?(d), "::Datum.loaded_data missing"
    end
    validate_directories
  else
    chk_less @datum.datum_id, expected, "datum_id"
  end
end

def validate_directories
  assert_not_nil ::Datum.path, "::Datum.path"
  assert_not_nil ::Datum.data_path, "::Datum.data_path"
  assert_not_nil ::Datum.scenario_path, "::Datum.scenario_path"
  assert_equal Rails.root.join('test', 'datum'), ::Datum.path
  assert_equal Rails.root.join('test', 'datum', 'data'), ::Datum.data_path
  assert_equal Rails.root.join('test', 'datum', 'scenarios'), ::Datum.scenario_path
end

def chk_less lesser, greater, attrib
  assert lesser < greater, "#{attrib} is >= #{greater}, actual: #{lesser}"
end


#test_instance, data_test_method

Capybara.register_driver :firefox_driver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox,
    :profile => 'name_of_existing_profile')
end


##ActiveRecord::SchemaDumper.ignore_tables = ['foo_table', 'bar_table']
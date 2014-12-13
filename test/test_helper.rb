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

def check_datum_properties method_name, expected
  verify_datum method_name, @datum, expected
  assert_nil Datum.context; assert_not_nil Datum.data_files
  dk = DataFile.datum_key(@datum.datum_test_instance, @datum.datum_test_method)
  d = Datum.loaded_data[dk]
  assert_not_nil d, "datum should be stored in loaded_data"
  verify_datum method_name, d, expected
end

def verify_datum method_name, datum, expected
  assert_equal datum.datum_id, datum.datum_data_file.called_tests.length
  if datum.datum_id == datum.datum_length
    assert_equal expected, datum.datum_id
    assert_equal expected, datum.datum_length
    assert_equal expected, datum.datum_data_file.called_tests.length
    ar = Array.new datum.datum_data_file.called_tests
    for i in 0..(ar.length - 1)
      assert_not_nil(x = ar.index(z = i + 1), "idx of #{z} in #{ar} is nil")
      assert_not_nil(r = ar.delete_at(x), "rmv #{x} of #{z} in #{ar} is nil")
    end
    assert_equal 0, ar.length
  else
    assert datum.datum_id <= expected, "datum id is <= than expected"
  end
  assert_equal method_name.to_s, datum.datum_data_method
  assert_equal self.class, datum.datum_test_instance; assert_not_nil datum
  m, i = Datum::Utils.test_to_data_method_with_index(datum.datum_test_method)
  assert_equal(datum.datum_id, i)
  assert_equal(datum.datum_data_method, m)
  assert(datum.datum_id <= datum.datum_length)
  assert(datum.datum_id <= datum.datum_count)
  df = Datum.data_files[datum.datum_data_method.to_sym]
  pdf = datum.datum_data_file
  assert_not_nil pdf; assert_not_nil df; assert_equal df, pdf
  assert_not_equal 0, df.test_count; assert datum.datum_id <= df.test_count
  assert_not_nil df.test_instance; assert_equal df.test_instance, self.class
  assert_equal df.data_method, datum.datum_data_method
  tst_name = DataFile.data_test_method(df.data_method, datum.datum_id)
  d_key = DataFile.datum_key(df.test_instance, tst_name)
  assert_not_nil d_key; assert Datum.loaded_data.has_key? d_key
  assert_equal(datum.datum_test_method, tst_name)
end

#test_instance, data_test_method
Capybara.register_driver :firefox_driver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox,
    :profile => 'name_of_existing_profile')
end


##ActiveRecord::SchemaDumper.ignore_tables = ['foo_table', 'bar_table']
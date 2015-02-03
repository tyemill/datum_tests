require 'test_helper'
class PersonTest < ActiveSupport::TestCase

  data_test "simpsons_name_check" do
    process_scenario :basic_with_import
    person_to_check = self.instance_variable_get("@#{@datum.first_name.downcase}")
    assert_equal @datum.first_name, person_to_check.first_name
    assert_equal @datum.last_name, person_to_check.last_name
    assert_equal @datum.name, person_to_check.name
    assert_equal @datum.short_name, person_to_check.short_name
    check_datum_properties(__method__, expected_length)
  end


end

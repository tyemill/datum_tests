require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  data_test "simpsons_name_check" do
    process_scenario :basic_with_import
    psn = self.send(@datum.person_label)
    assert_equal @datum.first_name, psn.first_name
    assert_equal @datum.last_name, psn.last_name
  end

end

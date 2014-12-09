require 'test_helper'

class DatumTest < ActiveSupport::TestCase
  data_test "base_test" do
    check_datum_properties(__method__)
  end

  data_test "basic" do
    check_datum_properties(__method__)
  end
end
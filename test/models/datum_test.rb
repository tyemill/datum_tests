require 'test_helper'

class DatumTest < ActiveSupport::TestCase

  #f = Bar::Foo.new
  #f.goo
  #f.bar

  #Foo.bar
  #Foo.problem
  #Foo.goo

  #f = Foo.new
  #f.goo



  data_test "basic" do
    chr = (@datum.datum_id + 64).chr
    assert_equal "#{chr} String", @datum.a_string, "a_string invalid"
    assert_equal @datum.datum_id, @datum.a_int
    assert_equal !!@datum.a_true_boolean, @datum.a_true_boolean
    assert @datum.a_true_boolean
    assert_equal !!@datum.a_false_boolean, @datum.a_false_boolean
    assert_not @datum.a_false_boolean
#    check_datum_properties(__method__, expected_length)

  end
end
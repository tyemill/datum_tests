require 'test_helper'


def xdata_test name_of_data_file, &block
    puts "in xdata_test"
    puts "this is self: #{self}"
    # if no receiver - add one

end

class DatumTest < ActiveSupport::TestCase

  ## dynamically added:
  def test_base_test_1
    @datum = @base_test[__method__.split("_").last.to_i]
  end


  xdata_test "base_test" do
    puts "this is the base_test"
  end

## dynamically added:
private
  def base_test
    puts "this is the base_test"
  end

  def receive_data_structure structure
    # i have a new structure
    # add a test specific bucket for structures if it doesn't exit
    # add current structure to bucket
    # add data test to class
  end

  def add_data_test name
    # add method
    # in method:
    #  get test specific bucket, get datum for name / index
    #  call data method with proper datum addressed
  end

end
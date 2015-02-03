
require 'test_helper'

class DatumHelperTest < ActionView::TestCase
  parse_in Rails.root.join('test', 'lib', 'shared_cases', 'datum_code.rb'), binding
  #puts ::Datum.loaded_data.keys
end
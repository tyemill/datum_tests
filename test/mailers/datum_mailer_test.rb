require 'test_helper'

class DatumMailerTest < ActionMailer::TestCase
  parse_in Rails.root.join('test', 'lib', 'shared_cases', 'datum_code.rb')
end
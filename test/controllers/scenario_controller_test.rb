require 'test_helper'

class ScenarioControllerTest < ActionController::TestCase
  parse_in Rails.root.join('test', 'lib', 'shared_cases', 'scenario_code.rb')
end
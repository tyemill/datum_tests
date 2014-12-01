require 'test_helper'

class ScenarioIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  parse_in Rails.root.join('test', 'lib', 'shared_cases', 'datum_code.rb')
end
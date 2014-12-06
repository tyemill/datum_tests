require 'test_helper'

class RawApiTest < ActiveSupport::TestCase
    test "datum api" do
    p = Person.create first_name: "Homer", last_name: "Simpson"

    assert(
      Datum.read_file("simpsons_scenario", Datum.directories.scenario),
      "Scenario Read is nil")

    last = "Smith"
    assert_equal(Datum.scenario_clone_resource(
        p, {last_name: last})[:last_name], last)

    # doesn't work as is
    #puts Scenario::import :simpsons_scenario
    #puts @marge.inspect
    process_scenario :simpsons_scenario

    assert @marge, "Marge is nil"

  end

  test "datum api advanced" do
    process_scenario :basic_with_import
    assert @marge, "Marge is nil"
    assert @lou, "Lou is nil"
  end

  test "datum odd" do
    assert @homer.nil?, "Homer should be nil"
    assert @marge.nil?, "Marge should be nil"
    assert @bart.nil?, "Bart should be nil"
    assert @clancy.nil?, "Clancy should be nil"
    assert @lou.nil?, "Lou should be nil"
    assert @eddie.nil?, "Eddie should be nil"
  end

  test "datum directories" do
    assert Datum.directories.root, "Root Dir is nil"
    assert Datum.directories.data, "Data Dir is nil"
    assert Datum.directories.scenario, "Scenario Dir is nil"
  end
end
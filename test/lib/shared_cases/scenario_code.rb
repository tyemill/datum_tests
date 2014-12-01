
  test "should load basic scenario" do
    process_scenario :basic_simpsons
  end

  test "should verify basic scenario" do
    process_scenario "basic_simpsons"
    verify_basic_scenario
  end

  test "should load import" do
   process_scenario "basic_with_import"
   verify_basic_scenario
   verify_import_scenario
  end

  test "imported file by itself" do
    process_scenario "imported_by_basic"
    verify_import_scenario
  end
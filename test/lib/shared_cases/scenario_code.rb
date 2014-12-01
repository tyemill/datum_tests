
  test "should load basic scenario" do
    process_scenario :simpsons_scenario
  end

  test "should verify basic scenario" do
    process_scenario "simpsons_scenario"
    verify_basic_scenario @marge, @homer, @bart
  end

  test "should load import" do
   process_scenario "basic_with_import"
   verify_basic_scenario @marge, @homer, @bart
   verify_import_scenario @clancy, @eddie
   verify_lou @lou
  end

  test "imported file by itself" do
    process_scenario "imported_by_basic"
    verify_import_scenario @clancy, @eddie
  end
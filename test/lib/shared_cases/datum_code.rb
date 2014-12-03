
data_test "basic" do
  verify_basic_datum ## basic.scenario should be loaded - values correct
end

data_test "import" do
  verify_basic_datum
end

data_test "extended" do
  case @datum.id
  when 1
    assert @datum.datum_label.ends_with? "1"
    assert_equal @datum.third_value, ONLINE_STATUS_MASK  # erb - const ref
  when 2
    assert @datum.datum_label.ends_with? "2"
    assert_equal @datum.third_value, "blah blah" #erb, require, w method call
  else
    assert false, "Unknown id for extended datum cases. Unk id: #{@datum.id}"
  end
end

data_test "clone" do

  assert_equal @datum.basic_int, 1
  assert_equal @datum.basic_true_boolean, true
  assert_equal @datum.basic_false_boolean, false

  case @datum.id
  when 1
    assert_equal @datum.basic_string, "basic_string"
  when 2
    assert_equal @datum.basic_string, "cloned basic_string"
  else
    assert false, "Unknown id for extended datum cases. Unk id: #{@datum.id}"
  end

end
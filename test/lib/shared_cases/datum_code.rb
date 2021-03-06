data_test "base_test" do
  #:base_string, :base_array
  #Bs.new "base 1", ["str 1", true, false, {one: "one", two: "two"}]
  assert @datum.base_string.is_a? String
  assert_equal "base #{@datum.datum_id}", @datum.base_string
  assert @datum.base_array.is_a? Array
  assert_equal 4, @datum.base_array.length
  assert @datum.base_array[0].is_a? String
  assert_equal "str #{@datum.datum_id}", @datum.base_array[0]
  assert_equal !!@datum.base_array[1], @datum.base_array[1]
  assert @datum.base_array[1]
  assert_equal !!@datum.base_array[2], @datum.base_array[2]
  assert_not @datum.base_array[2]
  assert @datum.base_array[3].is_a? Hash
  i = @datum.datum_id
  @datum.base_array[3].each_pair { |key, value|
    sym = NUM_HLPR[i].to_sym; str = NUM_HLPR[i].to_str
    assert_equal key, sym; assert_equal value, str; i += 1
  }
  assert_equal @datum.datum_id + 2, i
  check_datum_properties(__method__, base_expected_length)
end

data_test "basic" do
  chr = (@datum.datum_id + 64).chr
  assert_equal "#{chr} String", @datum.a_string, "a_string invalid"
  assert_equal @datum.datum_id, @datum.a_int
  assert_equal !!@datum.a_true_boolean, @datum.a_true_boolean
  assert @datum.a_true_boolean
  assert_equal !!@datum.a_false_boolean, @datum.a_false_boolean
  assert_not @datum.a_false_boolean
  check_datum_properties(__method__, expected_length)
  #puts @datum.inspect
end
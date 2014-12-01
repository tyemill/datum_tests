
first_value = "The first first value"

define_datum first_value: first_value,
  second_value: "The first second value",
  third_value: ONLINE_STATUS_MASK

require 'datum/data/test_code/random'

define_datum first_value: first_value,
  second_value: "The second second value",
  third_value: TestCode::Random.get_blah_blah




#Datum.reusable_struct Bsic, DatumStruct.new(:basic_string, :basic_int,
#  :basic_true_boolean, :basic_false_boolean)

Bsic = DatumStruct.new(:basic_string, :basic_int, :basic_true_boolean,
  :basic_false_boolean)

Bsic.new "basic_string", OFFLINE_STATUS_MASK, true, false
Bsic.new "basic_string 2", 2, true, false
Bsic.new "basic_string 3", 3, true, false


# define_datum basic_string: "basic_string",
#   basic_int: OFFLINE_STATUS_MASK,
#   basic_true_boolean: true,
#   basic_false_boolean: false

# define_datum basic_string: "basic_string 2",
#   basic_int: ONLINE_STATUS_MASK,
#   basic_true_boolean: true,
#   basic_false_boolean: false

# define_datum basic_string: "basic_string 3",
#   basic_int: 3,
#   basic_true_boolean: true,
#   basic_false_boolean: false

# define_datum basic_string: "basic_string 4",
#   basic_int: 4,
#   basic_true_boolean: true,
#   basic_false_boolean: false


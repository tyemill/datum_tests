Cln = DatumStruct.new(:basic_string, :basic_int, :basic_true_boolean,
  :basic_false_boolean)

basic_struct = Cln.new({basic_string: "clone start string", basic_int: 1,
  basic_true_boolean: true, basic_false_boolean: false})

basic_struct.dup({basic_string: "cloned basic_string"})
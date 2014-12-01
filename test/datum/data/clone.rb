
h = {basic_string: "basic_string", basic_int: 1, basic_true_boolean: true,
  basic_false_boolean: false}

define_datum h
x = h.dup; x[:basic_string] = "cloned basic_string"
define_datum x

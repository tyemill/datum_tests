
Bsic = DatumStruct.new(:basic_string, :basic_int, :basic_true_boolean,
  :basic_false_boolean)

#import_data :basic

Bsic.new "basic_string 5", 5, true, false


#Datum.reusable_struct Bsic, DatumStruct.new(:basic_string, :basic_int,
#  :basic_true_boolean, :basic_false_boolean)


Bsic = Datum.new(:a_string, :a_int, :a_true_boolean, :a_false_boolean)
Bsic.new "A String", OFFLINE_STATUS_MASK, true, false
Bsic.new "B String", ONLINE_STATUS_MASK, true, false
Bsic.new "C String", 3, true, false
Bsic.new "D String", 4, true, false

def expected_length
  4
end



Bs = Datum.new(:base_string, :base_array)
Bs.new "base 1", ["str 1", true, false, {one: "one", two: "two"}]
#Bs.new "base 2", ["str 2", true, false, {two: "two", three: "three"}]
#Bs.new "base 3", ["str 3", true, false, {three: "three", four: "four"}]
#Bs.new "base 4", ["str 4", true, false, {four: "four", five: "five"}]
#Bs.new "base 5", ["str 5", true, false, {five: "five", six: "six"}]
#Bs.new "base 6", ["str 6", true, false, {six: "six", seven: "seven"}]
#Bs.new "base 7", ["str 7", true, false, {seven: "seven", eight: "eight"}]
#Bs.new "base 8", ["str 8", true, false, {eight: "eight", nine: "nine"}]

def base_expected_length
  8
end

NUM_HLPR = ["zero", "one", "two", "three", "four", "five", "six", "seven",
  "eight", "nine"]


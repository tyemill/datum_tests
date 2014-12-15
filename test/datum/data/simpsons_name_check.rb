
Prsn = Datum::DatumStruct.new(:first_name, :last_name, :name, :short_name)

homer = Prsn.new(
  "Homer",
  "Simpson",
  "Homer Simpson",
  "Homer S.")

marge = Prsn.new(
  "Marge",
  homer.last_name,
  "Marge #{homer.last_name}",
  "Marge S.")

marge.dup({first_name: "Bart", name: "Bart #{homer.last_name}",
  short_name: "Bart S."})

eddie = Prsn.new({first_name: "Eddie", name: "Eddie Police-Officer",
  last_name: "Police-Officer", short_name: "Eddie P."})

Prsn.new(
  "Clancy",
  "Wiggum",
  "Clancy Wiggum",
  "Clancy W.")

Prsn.new(
  "Lou",
  eddie.last_name,
  "Lou #{eddie.last_name}",
  "Lou P.")

def expected_length
  6
end

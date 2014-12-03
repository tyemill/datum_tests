
Prsn = DatumStruct.new(:first_name, :last_name, :name, :short_name)

homer = Prsn.new(
  "Homer",
  "Simpson",
  "Homer Simpson",
  "Homer S.")

Prsn.new(
  "Marge",
  homer.last_name,
  "Marge #{homer.last_name}",
  "Marge S.")

Prsn.new(
  "Bart",
  homer.last_name,
  "Bart #{homer.last_name}",
  "Bart S.")

eddie = Prsn.new(
  "Eddie",
  "Police-Officer",
  "Eddie Police-Officer",
  "Eddie P.")

Prsn.new(
  "Clancy",
  "Wiggum",
  "Clancy Wiggum",
  "Clancy W.")

Prsn.new(
  "Lou",
  eddie.last_name,
  "Marge #{eddie.last_name}",
  "Lou P.")

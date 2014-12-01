


@marge = Person.create(
  first_name: "Marge",
  last_name: "Simpson",
  status_mask: OFFLINE_STATUS_MASK)

@homer = @marge.dup
@homer.first_name = "Homer"
@homer.save

@bart = @marge.dup
@bart.first_name = "Bart"
@bart.status_mask = ONLINE_STATUS_MASK
@bart.save

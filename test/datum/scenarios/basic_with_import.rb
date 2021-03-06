
@marge = Person.create(
  first_name: "Marge",
  last_name: "Simpson",
  status_mask: OFFLINE_STATUS_MASK)

@homer = Person.create(__clone(@marge, {first_name: "Homer"}))

@bart = Person.create(__clone(@marge,
  { first_name: "Bart", status_mask: ONLINE_STATUS_MASK}))

__import :imported_by_basic # will give us clancy, eddie

@lou = Person.create first_name: "Lou", last_name: @eddie.last_name,
  status_mask: ONLINE_STATUS_MASK
# Delete old seeds
p "Delete old seeds"
Booking.destroy_all
Car.destroy_all
User.destroy_all

# User seeds
p "Création de users"
User.create(
  email: "idategto11@gmail.com",
  password: "password"
)
User.create(
  email: "ilyes.messaoudene13013@gmail.com",
  password: "password"
)
User.create(
  email: "candice.fays@ymail.com",
  password: "password"
)
User.create(
  email: "charlottebene@gmail.com",
  password: "password"
)

# Cars seeds
i = 1
nb_cars = 10
p "Création de #{nb_cars} voitures"
while i <= nb_cars
  Car.create(
    brand: "Renault",
    model: "Clio #{i}",
    address: "#{i} rue Sainte Cécile 13005 Marseille",
    year_of_production: 1990 + i,
    price_per_day: 23.99 + i,
    user: User.find(rand(User.first.id..User.last.id))
  )
  i += 1
end

# Bookings seeds
i = 1
nb_bookings = 10
p "Création de #{nb_bookings} bookings"
while i <= nb_bookings
  starts_at = (Date.today - rand(1..30))
  ends_at = starts_at + rand(1..30)
  Booking.create(
    starts_at:,
    ends_at:,
    accepted: rand(1..2) == 2,
    user: User.find(rand(User.first.id..User.last.id)),
    car: Car.find(rand(Car.first.id..Car.last.id))
  )
  i += 1
end

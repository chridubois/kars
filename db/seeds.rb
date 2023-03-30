require 'csv'
require 'open-uri'

# # Delete old seeds
# p "Delete old seeds"
# Booking.destroy_all
# Car.destroy_all
# User.destroy_all

# # User seeds
# p "Création de users"
# User.create(
#   email: "idategto11@gmail.com",
#   password: "password"
# )
# User.create(
#   email: "ilyes.messaoudene13013@gmail.com",
#   password: "password"
# )
# User.create(
#   email: "candice.fays@ymail.com",
#   password: "password"
# )
# User.create(
#   email: "charlottebene@gmail.com",
#   password: "password"
# )

# # Cars seeds
# i = 1
# nb_cars = 10
# p "Création de #{nb_cars} voitures"
# while i <= nb_cars
#   Car.create(
#     brand: "Renault",
#     model: "Clio #{i}",
#     address: "#{i} rue Sainte Cécile 13005 Marseille",
#     year_of_production: 1990 + i,
#     price_per_day: 23.99 + i,
#     user: User.find(rand(User.first.id..User.last.id))
#   )
#   i += 1
# end

# # Bookings seeds
# i = 1
# nb_bookings = 10
# p "Création de #{nb_bookings} bookings"
# while i <= nb_bookings
#   starts_at = (Date.today - rand(1..30))
#   ends_at = starts_at + rand(1..30)
#   Booking.create(
#     starts_at:,
#     ends_at:,
#     accepted: rand(1..2) == 2,
#     user: User.find(rand(User.first.id..User.last.id)),
#     car: Car.find(rand(Car.first.id..Car.last.id))
#   )
#   i += 1
# end


url = "https://www.classicnumber.com/cars-list.php"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML.parse(html_file)

cars_urls = html_doc.xpath("//div[contains(@class, 'adimg')]/a/@href").map { |attr| "https://www.classicnumber.com/" + attr.value }.compact
p cars_urls

cars_urls[0..1].each do |url|
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  # Get Car model
  model = html_doc.search('.col-sm-9 h2').text
  p model

  # Get Car image
  image_url = html_doc.xpath("//div[contains(@class, 'galerie-main')]/a/@href").map { |attr| "https://www.classicnumber.com/" + attr.value }.compact.first
  p image_url

  #Get Car year
  year = html_doc.xpath("//ul[contains(@class, 'car-list-infos-1')]/li").first.text
  p year

  Car.create(
    brand: brand,
    model: model,
    year_of_production: year
  )

end

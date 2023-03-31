require 'csv'
require 'open-uri'

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

# # Cars seeds
pages_count = 0
while pages_count < 3
  url = "https://www.classicnumber.com/cars-list.php?np=#{pages_count}/"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  cars_urls = html_doc.xpath("//div[contains(@class, 'adimg')]/a/@href").map { |attr| "https://www.classicnumber.com/" + attr.value }.compact
  p cars_urls

  cars_urls.each do |car_url|
    html_file = URI.open(car_url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    # Get Car model & brand
    concat = html_doc.search('.col-sm-9 h2').first.text
    brand = concat.split.first
    model = concat.split[1..-1].join(' ')

    # Get Car image
    image_url = html_doc.xpath("//div[contains(@class, 'galerie-main')]/a/@href").map { |attr| "https://www.classicnumber.com/" + attr.value }.compact.first

    #Get Car year
    year = html_doc.xpath("//ul[contains(@class, 'car-list-infos-1')]/li").first.text

    #Get Car Address
    address = html_doc.xpath("//div[contains(@class, 'seller-address place')]/a").first.attribute_nodes[2].value

    find_car = Car.find_by(brand:, model:)
    if find_car.nil?
      Car.create(
        brand:,
        model:,
        year_of_production: year,
        address:,
        image_url:,
        price_per_day: rand(11.2...99.9),
        user: User.find(rand(User.first.id..User.last.id))
      )
    end
    p "A car has been created from page #{pages_count} !"
  end
  pages_count += 1
end
p "#{Car.all.count} cars has been created"

i = 1
nb_bookings = 30
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

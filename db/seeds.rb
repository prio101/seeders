# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do
  Campaign.create(
    name: Faker::Movie.title,
    image_url: Faker::LoremFlickr.image,
    target_amount_in_pence: 200000,
    sector: Faker::IndustrySegments.sector,
    country: Faker::Address.country,
    amount_raised_in_pence: 5000
  )
end
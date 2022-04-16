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
    target_amount: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    sector: Faker::IndustrySegments.sector,
    country: Faker::Address.country,
    amount_raised: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )
end
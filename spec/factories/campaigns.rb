FactoryBot.define do
  factory :campaign do
    name  { Faker::Name.name }
    image_url { Faker::LoremFlickr.image }
    target_amount_in_pence { 200_000 }
    sector { Faker::IndustrySegments.sector }
    country { Faker::Address.country }
    amount_raised_in_pence { 5000 }
  end
end

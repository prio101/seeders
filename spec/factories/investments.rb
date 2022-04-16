FactoryBot.define do
  factory :investment do
    name { Faker::Name.name }
    contact_email { Faker::Internet.email }
    amount { 400 }
    campaign
  end
end

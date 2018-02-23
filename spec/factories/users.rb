FactoryBot.define do

  factory :user do
    full_name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    address { Faker::Address.street_address }
  end


end

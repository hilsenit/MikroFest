FactoryBot.define do

  factory :user do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    address { Faker::Address.street_address }
    password { Faker::Internet.password }
  end


end

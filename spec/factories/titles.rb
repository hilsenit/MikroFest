FactoryBot.define do

  factory :title do
    price 1000
    title Faker::Lorem.sentence(1)
    description Faker::Lorem.sentence(3)
    image Rails.root.join('app/assets/images/test/title.jpg').open
    publisher_id nil
  end

end

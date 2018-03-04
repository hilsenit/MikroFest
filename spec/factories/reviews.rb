FactoryBot.define do
  factory :review do
    url Faker::Internet.url
    written_by Faker::Name.first_name
    text Faker::Lorem.sentence(4)
    title_id nil
  end
end

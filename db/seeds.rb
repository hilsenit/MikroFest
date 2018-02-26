require 'faker'

User.create!(email: Faker::Internet.email, password: "hejmeddig", full_name: "Captain Lorem", address: Faker::Address.street_address)

  Publisher.create!(name: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(18), image: Rails.root.join('app/assets/images/test/publisher.jpg').open)
  Publisher.create!(name: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(18), image: Rails.root.join('app/assets/images/test/london.jpg').open)

6.times do
  Title.create!(title: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(10), publisher_id: Publisher.first.id, image: Rails.root.join('app/assets/images/test/title-2.jpg').open)
end


3.times do
  Title.create!(title: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(10), publisher_id: Publisher.last.id, image: Rails.root.join('app/assets/images/test/title.jpg').open)
end

puts "#{User.count} user created - #{Publisher.count} publishers created - #{Title.count} titles created"

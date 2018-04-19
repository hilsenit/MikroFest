require 'faker'

user = User.new(admin: true, email: "hej@eksempel.dk", password: "hejmeddig", full_name: "Captain Lorem", address: Faker::Address.street_address, favorite_word: "Ballon")
user.assign_customer_id
user.skip_confirmation!
user.save!

user_2 = User.new(email: "hejmeddig@eksempel.dk", password: "hejmeddig", full_name: "Benny Andersen", address: Faker::Address.street_address, favorite_word: "Ballon")
user_2.assign_customer_id
user_2.skip_confirmation!
user_2.save!

  forlag_1 = Publisher.new(name: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(18), image: Rails.root.join('app/assets/images/test/publisher.jpg').open, email: 'forlag1@eksempel.dk', password: "hejmeddig")
  forlag_1.save!

  forlag_2 = Publisher.new(name: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(18), image: Rails.root.join('app/assets/images/test/london.jpg').open, email: 'forlag2@eksempel.dk', password: "hejmeddig" )
  forlag_2.save!

8.times do
  Title.create!(price: 132, title: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(10), publisher_id: Publisher.first.id, image: Rails.root.join('app/assets/images/test/title-2.jpg').open)
end


10.times do
  Title.create!(price: 220, title: Faker::Lorem.sentence(3), description: Faker::Lorem.sentence(10), publisher_id: Publisher.last.id, image: Rails.root.join('app/assets/images/test/title.jpg').open)
end

3.times do
  Review.create!(written_by: Faker::Name.first_name, text: Faker::Lorem.sentence(10), title_id: Title.last.id, url: Faker::Internet.url)
end

Favorite.create!(user_id: User.first.id, title_id: Title.last.id)
Favorite.create!(user_id: User.last.id, title_id: Title.last.id)
Favorite.create!(user_id: User.last.id, title_id: Title.first.id)

Mikrogram.create!(publisher_id: Publisher.last.id, title: "Man skal ikke kaste med sten, når man selv bor i et glashus", description: Faker::Lorem.sentence(5))
Mikrogram.create!(publisher_id: Publisher.first.id, title: "Hvorfor bugter vejen sådan?", description: Faker::Lorem.sentence(5))

Mikrogram.create!(publisher_id: Publisher.first.id, title: "Der var engang en, der gjorde noget godt", description: Faker::Lorem.sentence(7))

Mikrogram.create!(publisher_id: Publisher.last.id, title: "Man skal ikke kaste med sten, når man selv bor i et glashus", description: Faker::Lorem.sentence(5))

Mikrogram.create!(publisher_id: Publisher.first.id, title: "Hvorfor bugter vejen sådan?", description: Faker::Lorem.sentence(5))

Mikrogram.create!(publisher_id: Publisher.first.id, title: "Der var engang en, der gjorde noget godt", description: Faker::Lorem.sentence(7))

puts "#{User.count} user created - #{Publisher.count} publishers created - #{Title.count} titles created - #{Review.count} reviews created - #{Favorite.count} favorites created"

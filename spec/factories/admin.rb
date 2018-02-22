FactoryBot.define do
  factory :admin do
    sequence :email {|n| "example#{n}@gmail.com" }
    password "password"
  end
end

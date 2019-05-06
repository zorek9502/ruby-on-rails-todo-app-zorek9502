FactoryBot.define do
  factory :user, class: User do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    description { Faker::TvShows::GameOfThrones.quote }
  end
end

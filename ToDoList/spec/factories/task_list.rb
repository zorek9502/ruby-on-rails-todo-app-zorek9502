FactoryBot.define do
  factory :task do
    description { Faker::Commerce.product_name }
    association :task_list
  end

  factory :task_list do
    title { Faker::TvShows::BreakingBad.character }
    association :user
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    description { Faker::TvShows::GameOfThrones.quote }
    password { "Holamundo123" }
  end
end

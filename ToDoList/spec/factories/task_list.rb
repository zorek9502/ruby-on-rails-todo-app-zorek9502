FactoryBot.define do
  factory :task_list do
    user = User.first
    user_id { user.id }
    title { Faker::TvShows::BreakingBad.character }
  end
end

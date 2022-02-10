FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    due_date { "2022-02-10" }
    category
    user
  end
end

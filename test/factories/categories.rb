FactoryBot.define do
  factory :category do
    name { Faker::Team.name }
    description { Faker::Lorem.sentence }
  end
end

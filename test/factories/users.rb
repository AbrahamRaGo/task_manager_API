FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::internet.email }
    auth_token { "xxxxx" }
  end
end

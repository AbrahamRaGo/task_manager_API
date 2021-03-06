# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  auth_token :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint
#
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    auth_token { "xxxxx" }
    role
  end
end

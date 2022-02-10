# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  roles = ["Admin", "Participant"]
  factory :role do
    name { roles[rand(0..1)] }
  end
end

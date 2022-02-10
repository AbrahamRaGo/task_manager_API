# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  finished    :boolean          not null
#
FactoryBot.define do
  finished_values = [true, false]
  factory :task do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    due_date { "2022-02-10" }
    category
    user
    finished {finished_values[rand(0..1)]}
  end
end

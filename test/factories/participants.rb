# == Schema Information
#
# Table name: participants
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  role_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint
#
FactoryBot.define do
  factory :participant do
    # user
    # task
    role
  end
end

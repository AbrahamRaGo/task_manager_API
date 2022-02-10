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
class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :task
end

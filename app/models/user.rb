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
class User < ApplicationRecord
  has_many :owned_tasks
  has_many :participations, class_name: 'Participant'
  has_many :tasks, through: :participations
  belongs_to :role
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :auth_token, presence: true
  # validates :auth_token, uniqueness: true
end

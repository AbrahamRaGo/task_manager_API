class User < ApplicationRecord
  has_many :tasks
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :auth_token, presence: true
  validates :auth_token, uniqueness: true
end

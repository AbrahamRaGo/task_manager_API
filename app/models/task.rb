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
class Task < ApplicationRecord
  validates :name, presence: true
  #? En el caso de validar booleanos se usa la siguiente estructura en lugar de presence
  validates :finished, inclusion: { in: [true, false] }
  belongs_to :category
  belongs_to :user
  has_many :participating_users , class_name: 'Participant', dependent: :destroy
  has_many :participants, through: :participating_users, source: :user

  accepts_nested_attributes_for :participating_users, allow_destroy: true
end

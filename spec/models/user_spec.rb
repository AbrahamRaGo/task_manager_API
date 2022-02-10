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
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:email)
      should validate_presence_of(:auth_token)
    end
    
    it "validate belongs to" do
      should belong_to(:role)
    end

    it "validate uniqueness fields" do
      should validate_uniqueness_of(:email)
      # should validate_uniqueness_of(:auth_token)
    end

    it "validate relations" do
      should have_many(:tasks)
      should have_many(:participations)
    end
  end
end

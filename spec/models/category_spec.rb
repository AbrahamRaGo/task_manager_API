# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Validations" do
    it "validate precence of name" do
      should validate_presence_of(:name)
    end
    it "validate uniqueness of name" do
      should validate_uniqueness_of(:name)
    end
    it "validate relations" do
      should have_many(:tasks)
    end
  end
end

require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

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

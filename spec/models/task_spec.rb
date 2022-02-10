require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "Validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:name)
    end

    it "validate belongs to user and task" do
      should belong_to(:user)
      should belong_to(:category)
    end
  end
end

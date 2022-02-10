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
require 'rails_helper'

RSpec.describe Participant, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "Validations" do
    it "validate belons to" do
      should belong_to(:user)
      should belong_to(:role)
      should belong_to(:task)
    end
  end
end

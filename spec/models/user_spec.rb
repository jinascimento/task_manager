require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    it "is not valid without a required field" do
      user = User.new
      expect(user).to_not be_valid
    end

    it "is valid with all required fields" do
      user = create(:user)
      expect(user).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs_to person' do
      user = create(:user)
      expect(user.person).to_not be_nil
    end
  end
end

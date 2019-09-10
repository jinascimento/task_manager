require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validates' do
    it "is not valid without a required field" do
      person = Person.new(name: nil)
      expect(person).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has_many tasks' do
      person = create(:person, :with_tasks, qtt_tasks: 3)
      expect(person.tasks.count).to eq(3)
    end
  end
end

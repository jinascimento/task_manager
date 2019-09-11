require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validates' do
    it "is not valid without a required field" do
      task = Task.new(title: nil)
      expect(task).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs_to responsible' do
      responsible = create(:person)
      task = create(:task, start: DateTime.now, end: DateTime.now + 1, responsible: responsible)
      expect(task.responsible).to_not be_nil
    end
  end

  describe '#all_day_task?' do
    it 'when task is schedule to all day' do
      responsible = create(:person)
      task = create(:task, start: Date.current.beginning_of_day, end: (Date.current + 1).beginning_of_day, responsible: responsible)
      expect(task.all_day_task?).to be_truthy
    end

    it 'when task is not schedule to all day' do
      responsible = create(:person)
      task = create(:task, start: Date.current.beginning_of_day, end: (DateTime.now + 1), responsible: responsible)
      expect(task.all_day_task?).to be_falsey
    end
  end
end

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#toggle_complete!" do
    it 'should switch complete to false if it is true' do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it is false' do
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe "#toggle_favorite" do
    it 'should switch complete to true if it false' do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it 'should switch complete to false if it true' do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe "#overdue?" do
    it 'should return true is it is overdue' do
      task = Task.new(deadline: "2016-05-04")
      expect(task.overdue?).to eq(true)
    end
    it 'should return false is it is overdue' do
      task = Task.new(deadline: "2016-05-10")
      expect(task.overdue?).to eq(false)
    end
  end

  describe "#increment_priority!" do
    it 'should increment_priority if less than 10' do
      task = Task.new(priority: 1)
      task.increment_priority!
      expect(task.priority).to eq(2)
    end
    it 'should not increment_priority if already 10' do
      task = Task.new(priority: 10)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end
    it 'should decrement_priority if greater than 1' do
      task = Task.new(priority: 2)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
    it 'should not decrement_priority if 1' do
      task = Task.new(priority: 1)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end
  describe "#snooze_hour" do
    it 'should snooze_hour of deadline' do
      task = Task.new(deadline: "2016-05-10 20:17")
      task.snooze_hour!
      expect(task.deadline).to eq("2016-05-10 21:17")
    end
  end
end

require "test_helper"

class TaskTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'validates presence of name and project' do
      task = Task.new
      assert_not task.valid?
      assert task.errors.full_messages.include? "Name can't be blank"
      assert task.errors.full_messages.include? "Project must exist"
    end
  end
end

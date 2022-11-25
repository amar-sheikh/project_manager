require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  describe 'validations' do
    it 'validates presence of name, description and user' do
      project = Project.new
      assert_not project.valid?
      assert project.errors.full_messages.include? "Name can't be blank"
      assert project.errors.full_messages.include? "Description can't be blank"
      assert project.errors.full_messages.include? "User must exist"
    end
  end
end

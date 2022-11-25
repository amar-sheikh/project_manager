require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @task = tasks(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should create task" do
    assert_difference("Task.count") do
      post project_tasks_url(@task.project), params: { task: { assigned_to: @task.assigned_to, description: @task.description, name: @task.name, project_id: @task.project_id } }
    end

    assert_redirected_to project_url(Task.last.project)
  end

  test "should get edit" do
    get edit_project_task_url(@task.project, @task)
    assert_response :success
  end

  test "should update task" do
    patch project_task_url(@task.project, @task), params: { task: { assigned_to: @user.id, description: @task.description, name: @task.name, project_id: @task.project_id } }
    assert_redirected_to project_url(@task.project)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete project_task_url(@task.project, @task)
    end

    assert_redirected_to project_url(@task.project)
  end
end

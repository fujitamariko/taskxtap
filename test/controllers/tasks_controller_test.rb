require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { assortment: @task.assortment, content: @task.content, deadline_on: @task.deadline_on, major_category: @task.major_category, medium_category: @task.medium_category, plan_hours: @task.plan_hours, spend_hours: @task.spend_hours, status: @task.status, sub_category: @task.sub_category } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { assortment: @task.assortment, content: @task.content, deadline_on: @task.deadline_on, major_category: @task.major_category, medium_category: @task.medium_category, plan_hours: @task.plan_hours, spend_hours: @task.spend_hours, status: @task.status, sub_category: @task.sub_category } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end

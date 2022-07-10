require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

    setup do
       @task = tasks(:two)  
    end

    test "should get index" do

        get tasks_path
        assert_response :success

    end

    test "should create a task" do

        post tasks_path, params: { task: {
                id: @task.id,
                category_id: @task.category_id,
                name: @task.name,
                description: @task.description,
                deadline: @task.deadline
            }
        }
        assert_response :success

    end

    test 'should show tasks' do
        
        get task_path(@task.id)
        assert_response :success

    end








    
end

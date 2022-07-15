require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

    setup do
       @task = tasks(:one)  
       @category = categories(:one)
    end

    test "should show task" do
        get category_task_path(category_id: @task.category_id, id:@task.id)
        assert_response :success
    end

    test "should create a task" do
        post category_tasks_path(category_id:@category.id), params: {task: {name:"name", description:"description", category_id:@category.id, deadline: Time.new}}
        assert_redirected_to category_path(id:@category.id)
    end

    test "should destroy a task" do



        assert_difference "Task.count",-1 do
            delete category_task_path(category_id:@task.category_id,id:@task.id)
        end

        assert_redirected_to category_path(@task.category_id)

    end


 
    
end

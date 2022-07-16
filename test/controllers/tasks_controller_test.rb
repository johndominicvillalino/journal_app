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

    test "should show all tasks" do
        
        post category_tasks_path(category_id:@category.id), params: {task: {name:"name", description:"", category_id:@category.id, deadline: Time.new}}
        
        assert_response 422
    end


    test "get create form" do

        get new_category_task_path(@category.id)
        assert_response :success

    end

    test "should update tasks" do


        patch category_task_path(category_id:@task.category_id, id:@task.id), 
            params: { 
                task: {
                    description: "New description test"
                }
            }

        follow_redirect!
        assert_response :success

    end


    test "should fail update tasks" do


        patch category_task_path(category_id:@task.category_id, id:@task.id), 
            params: { 
                task: {
                    description: ""
                }
            }

        assert_response 422

    end

 
    
end

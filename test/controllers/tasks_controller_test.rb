require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest


    include Devise::Test::IntegrationHelpers

    setup do
        @user = users(:one)
        @user_two = users(:two)

       @task = tasks(:one)  
       @task_two = tasks(:two)  
       @category = categories(:one)
       sign_in @user
    

    end


    test "should show task" do
        get category_task_path(category_id: @task.category_id, id:@task.id)
        assert_response :success
    end

    test "should create a task" do
        post category_tasks_path(category_id:@category.id), params: {task: {name:"name", description:"description", category_id:@category.id, deadline: Time.new}}
        assert_redirected_to category_path(id:@category.id)
    end

    test "should fail in creating a task if params missing" do
        post category_tasks_path(category_id:@category.id), params: {task: {name:"", description:"description", category_id:@category.id, deadline: Time.new}}
        assert_response 422
    end



    test "should destroy a task" do
    


        assert_difference "Task.count",-1 do
            delete category_task_path(category_id:@task.category_id,id:@task.id), headers: { "HTTP_REFERER": "/categories/tasks/overdue" } 
            
        end

        follow_redirect!
        assert_response :success



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


    test "should redirect if not login" do

        
        cat_id = @user_two.categories.first.id
        task_id = @user_two.categories.first.tasks.first.id
        get category_task_path(category_id:cat_id,id:task_id)
        assert_redirected_to categories_path
      
    end

 
    
end

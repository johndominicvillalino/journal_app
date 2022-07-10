class TasksController < ApplicationController

    before_action :set_task, only: %i[show destroy]

    def index

        @tasks = Task.all
        
    end

    def show



    end

    def create

        @task = Task.new(task_params)


        if @task.save
            render json: @task 
        else
            render json: @task.errors
        end


        
    end


    def destroy 
 
        @task.destroy

    end


         
    def task_params 
        params.require(:task).permit(:name,:description, :deadline, :category_id)
    end
    

    private
    def set_task
        
        @task = Task.find(params[:id])

    end

  


   


end
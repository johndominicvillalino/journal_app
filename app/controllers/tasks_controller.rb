class TasksController < ApplicationController


    before_action :set_task, only: %i[show destroy]
    before_action :get_cat, only: %i[ new create]

    def index

        @tasks = Task.all
        
    end


    def show


    end

    def create

        @task = Task.new(task_params)

        respond_to do |format|

            if @task.save
                format.html { redirect_to category_path(@task.category_id), notice: "Task was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end

        end
    end

    
    def destroy 
 
        @task.destroy
  

    end

    def new

        @task = Task.new

        

    end


         
    def task_params 
        params.require(:task).permit(:name,:description, :deadline, :category_id)
    end

    private
    def get_cat

        @cat_id = Category.find(params[:category_id])

    end
    

    private
    def set_task
        
        @task = Task.find(params[:id])
        

    end

  


   


end
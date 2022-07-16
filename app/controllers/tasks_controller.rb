class TasksController < ApplicationController


    before_action :set_task, only: %i[show destroy edit update]
    before_action :get_cat, only: %i[ new create edit update]



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

        
        respond_to do |format|
            format.html { redirect_to category_path(@task.category_id), notice: "#{@task.name} was deleted"}
          end

    end

    def edit
    end

    def new

        @task = Task.new

    end


    def update
        respond_to do |format|
          if @task.update(task_params)
            format.html { redirect_to category_path(@task.category_id), notice: "#{@task.name} was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
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
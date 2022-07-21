class CategoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_category, only: %i[ show destroy edit update ]
    before_action :auth_route, only: %i[ show edit ]


    

    

    def auth_route 
        @category_owner = Category.find(params[:id]).user_id

        if @category_owner != current_user.id
            redirect_to categories_path
        end
    end

    def index
      
        @categories = User.find(current_user.id).categories

    end

    def show

       

    end

    def edit
    end


    def update
        respond_to do |format|
          if @cat.update(category_params)
            format.html { redirect_to categories_path, notice: "#{@cat.name} was successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end


    def create 

        @category = Category.new(category_params)

        respond_to do |format|
     
            if @category.save
                format.html { redirect_to categories_path, notice: "Category was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end

        end
        
    end

    def new 
        @category = Category.new
    end

    def destroy 

        @cat.destroy
        respond_to do |format|
          format.html {redirect_to categories_path, notice: "#{@cat.name} was deleted"}
        end

    end

    def category_params
        params.require(:category).permit( :name, :user_id)
    end

    private
    def set_category
        
        @cat = Category.find(params[:id])
        

    end


end

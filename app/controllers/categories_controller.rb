class CategoriesController < ApplicationController

    before_action :set_category, only: %i[ show ]

    def index

        @categories = Category.all
        @cat = Category.joins( :tasks)

    end

    def show

        

    end


    def create 

        @category = Category.new(category_params)
     
            if @category.save
                render json: @category
            else
                redirect_to :new
            end
        
    end

    def new 

    end

    private
    def category_params
        params.permit( :name)
    end

    private
    def set_category
        
        @cat = Category.find(params[:id])

    end


end

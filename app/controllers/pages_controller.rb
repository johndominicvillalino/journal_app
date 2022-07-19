class PagesController < ApplicationController



 def home
    @login = User.new

    if user_signed_in?
      redirect_to categories_path
    end

 end


end
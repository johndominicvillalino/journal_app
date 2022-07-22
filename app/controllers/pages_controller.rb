class PagesController < ApplicationController

before_action :authenticate_user!, :except => [:home]


 def home
    
    if user_signed_in?
      redirect_to categories_path
    end

 end

 def today

 end
 def overdue

 end
 def incoming

 end



end
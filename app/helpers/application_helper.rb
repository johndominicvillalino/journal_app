module ApplicationHelper
    def resource_name
        :user
      end
    
      def resource
        @resource ||= User.new
      end
    
      def devise_mapping
       @devise_mapping ||= Devise.mappings[:user]
      end


      def bread_crumbs 

        current_path = request.env['PATH_INFO']
        current_path_arr =  current_path.split('/')

        if(current_path_arr.include? "update") 
          current_path_arr.delete('update')
        end
        if(current_path_arr.include? "new") 
          current_path_arr.delete('new')
        end
        if(current_path_arr.include? "edit") 
          current_path_arr.delete('edit')
        end


        current_path_arr.shift()
        current_path_arr

      end


      def get_task_name(id)

        Task.find(id).name

      end

      def get_cat_name(id)

        Category.find(id).name

      end

      def exist_edit_update?

        current_path = request.env['PATH_INFO']
        current_path_arr =  current_path.split('/')
         ['update','edit'].include? current_path_arr[current_path_arr.length - 1] 

      end

      def exist_new_update?
        current_path = request.env['PATH_INFO']
        current_path_arr =  current_path.split('/')
         ['new'].include? current_path_arr[current_path_arr.length - 1] 
      end

      def overdue_task(user_id)

         tasks = User.find(user_id).tasks.where("deadline < ?",today)
         

      end

      def today_task(user_id)

        tasks = User.find(user_id).tasks.where("deadline = ?",today)
       
     end


      def incoming_task(user_id)

         tasks = User.find(user_id).tasks.where("deadline > ?",today)
        
      end


      def today
        Time.new.utc.beginning_of_day
      end



end

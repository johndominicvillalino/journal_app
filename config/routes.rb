Rails.application.routes.draw do

  devise_for :users, controllers: {:sessions => "sessions" }

  devise_scope :user do
   root  to: "pages#home"
  end 

 
  # root :to => redirect('/users/sign_in')

  #category

  # get '/categories' => 'categories#index'
  # get '/categories/:id' => 'categories#show'
  # post '/categories' => 'categories#create'
  # get '/categories/new' => 'categories#new'


    resources :categories do 
      resources :tasks
    end

    get '/categories/tasks/today', to: 'pages#today', as:'today_tasks'
    get '/categories/tasks/overdue', to: 'pages#overdue', as:'overdue_tasks'
    get '/categories/tasks/incoming', to: 'pages#incoming', as:'incoming_tasks'



  #task

  # get '/tasks' => 'tasks#index'

  # post '/tasks' => 'tasks#index'

  # get '/tasks/id' => 'tasks#show'

  # delete '/tasks/:id' => 'tasks#destroy'


  


end

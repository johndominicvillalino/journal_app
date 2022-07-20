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



  #task

  # get '/tasks' => 'tasks#index'

  # post '/tasks' => 'tasks#index'

  # get '/tasks/id' => 'tasks#show'

  # delete '/tasks/:id' => 'tasks#destroy'


  


end

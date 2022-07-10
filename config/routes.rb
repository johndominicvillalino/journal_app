Rails.application.routes.draw do
 

  #category

  get '/categories' => 'categories#index'

  get '/categories/id' => 'categories#show'

  post '/categories' => 'categories#create'

  get '/categories/new' => 'categories#new'



  #task

  # get '/tasks' => 'tasks#index'

  # post '/tasks' => 'tasks#index'

  # get '/tasks/id' => 'tasks#show'

  # delete '/tasks/:id' => 'tasks#destroy'

  resources :tasks

end

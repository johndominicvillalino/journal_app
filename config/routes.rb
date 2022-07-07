Rails.application.routes.draw do
 

  get '/categories' => 'categories#index'

  get '/categories/id' => 'categories#show'

  post '/categories' => 'categories#create'

  get '/categories/new' => 'categories#new'




  # root "articles#index"
end

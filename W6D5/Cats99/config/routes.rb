Rails.application.routes.draw do
  # get 'cats/index'
  # get 'cats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats
end


  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'

  # resources :users do # make only the routes in the array
  #   resources :chirps, only: [:index
Rails.application.routes.draw do
  # ====> issues routes
  resources :issues, only: [:index, :create, :show]
  # get '/issues', to: 'issues#index'
  # post '/issues', to: 'issues#create'
  # get /issues/:id, to: 'issues#show'

  # ====> users routes
  resources :users, only: [:index]
  #get '/users', to: 'users#index'

  # ====> comments routes
  resources :comments, only: [:index]
  # get '/comments', to: 'comments#index'

  # ====> skills routes
  resources :skills, only: [:index]
  # get '/skills', to: 'skills#index'
end

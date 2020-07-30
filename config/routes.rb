Rails.application.routes.draw do
  # ====> sessions routes
  # resources :sessions, only: [:create]
  # post '/login', to: 'sessions#login'

  # ====> issues routes
  resources :issues, only: [:index, :create, :show, :destroy]
  # get '/issues', to: 'issues#index'
  # post '/issues', to: 'issues#create'
  # get /issues/:id, to: 'issues#show'
  # delete /issues/:id to: 'issues#destroy'
 
  # ====> users routes
  resources :users, only: [:index, :show, :create]
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'

  # ====> comments routes
  resources :comments, only: [:index]
  # get '/comments', to: 'comments#index'

  # ====> skills routes
  resources :skills, only: [:index]
  # get '/skills', to: 'skills#index'
end

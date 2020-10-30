Rails.application.routes.draw do
  # ====> sessions routes
  get '/home', to: 'sessions#home'
  post '/login', to: 'sessions#login'
  get '/autologin', to: 'sessions#autologin'

  # ====> issues routes
  resources :issues, only: [:index, :create, :update, :show, :destroy]
  # get '/issues', to: 'issues#index'
  # post '/issues', to: 'issues#create'
  # get /issues/:id, to: 'issues#show'
  # patch /issues/:id, to: 'issues#update'
  # delete /issues/:id to: 'issues#destroy'

  # ====> like_issues routes
  resources :like_issues, only: [:index, :create, :destroy]
  
  # ====> favorites routes
  resources :favorites, only: [:index, :create, :destroy]

  # ====> users routes
  resources :users, only: [:index, :show, :create]
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'

  # ====> comments routes
  resources :comments, only: [:index, :create, :update, :destroy]
  # get '/comments', to: 'comments#index'
  # post '/comments', to: 'comments#create'
  # delete '/comments/:id', to: 'comments#destroy'

  # ====> skills routes
  resources :skills, only: [:index]
  # get '/skills', to: 'skills#index'
end

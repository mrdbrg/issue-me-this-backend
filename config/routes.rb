Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 

      get '/home', to: 'sessions#home'
      post '/login', to: 'sessions#login'
      get '/autologin', to: 'sessions#autologin'

      resources :issues, only: [:index, :create, :update, :show, :destroy]

      resources :like_issues, only: [:index, :create, :destroy]

      resources :like_comments, only: [:index, :create, :destroy]
      
      resources :favorites, only: [:index, :create, :destroy]

      resources :users, only: [:index, :show, :update, :create]
      post '/users/:id/upload_photo', to: 'users#upload_photo'

      resources :comments, only: [:index, :create, :update, :destroy]

      resources :skills, only: [:index]

    end
  end
end

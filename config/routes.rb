Rails.application.routes.draw do
  root 'static_pages#home'

  
  resources :guest_sessions, only: [:create]
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get '/index_room:id', to: 'rooms#index',as: 'index_room'
 
  get '/profile:id', to: 'users#profile',as: 'profile_user'
  get '/index:id', to: 'users#index',as: 'index'
  get '/follower:id', to: 'users#follower',as: 'follower'
  get '/following:id', to: 'users#following',as: 'following'
  get '/setting:id', to: 'users#setting',as: 'setting'
  get '/edit_prf:id', to: 'users#edit_prf',as: 'edit_prf'
  get '/search:id', to: 'users#search',as: 'search'
  get '/favorite:id', to: 'users#favorite',as: 'favorite'
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/send_message:id', to: 'rooms#send_message',as: 'send_message'
  get '/match:id', to: 'users#matcher',as: 'match'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :relationships,       only: [:create, :destroy]
  resources :rooms
  resources :messages, :only => [:create]
  resources :communities
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  


end

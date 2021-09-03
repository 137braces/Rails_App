Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/policy'
  get 'static_pages/terms'
  
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
  get '/favorite:id', to: 'users#favorite',as: 'favorite'
  get '/community_list:id', to: 'users#community_list',as: 'community_list'
  
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
  resources :communities do
    resource :joins, only: [:create, :destroy]
  end
  
    get '/game:id', to: 'communities#game',as: 'game'
    get '/music:id', to: 'communities#music',as: 'music'
    get '/love:id', to: 'communities#love',as: 'love'
    get '/health:id', to: 'communities#health',as: 'health'
    get '/work:id', to: 'communities#work',as: 'work'
    get '/animal:id', to: 'communities#animal',as: 'animal'
    get '/sport:id', to: 'communities#sport',as: 'sport'
    get '/cafe:id', to: 'communities#cafe',as: 'cafe'
    get '/art:id', to: 'communities#art',as: 'art'
    get '/fashion:id', to: 'communities#fashion',as: 'fashion'
    get '/food:id', to: 'communities#food',as: 'food'
    get '/travel:id', to: 'communities#travel',as: 'travel'
    get '/info:id', to: 'communities#info',as: 'info'
  
  resources :users do
    member do
      get :following, :followers
    end
    get :joins, on: :collection
  end


end

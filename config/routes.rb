Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get '/message:id', to: 'users#message',as: 'message'
  get '/favorite:id', to: 'users#favorite',as: 'favorite'
  get '/tweet:id', to: 'microposts#tweet',as: 'tweet'
  
  get '/profile:id', to: 'users#profile',as: 'profile_user'
  get '/personality:id', to: 'users#personality',as: 'personality_user'
  get '/index:id', to: 'users#index',as: 'index'
  get '/from_opponent:id', to: 'users#from_opponent',as: 'from_opponent'
  get '/foot_print:id', to: 'users#foot_print',as: 'foot_print'
  get '/setting:id', to: 'users#setting',as: 'setting'
  get '/edit_prf:id', to: 'users#edit_prf',as: 'edit_prf'
  get '/search:id', to: 'users#search',as: 'search'
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :relationships,       only: [:create, :destroy]
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
end

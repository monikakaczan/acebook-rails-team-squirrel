Rails.application.routes.draw do
  get 'sessions/new'
  
  get 'sessions/create'
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions, only: [:new, :create]
  resources :users 
  resources :posts
  
  root 'users#new'


end

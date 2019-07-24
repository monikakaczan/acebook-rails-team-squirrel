Rails.application.routes.draw do
  # get 'sessions/new'

  # get 'sessions/create'

  root 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:index]
  resources :users do
    resources :posts
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
# , only: [:edit, :destroy, :update, :new]

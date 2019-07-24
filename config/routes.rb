Rails.application.routes.draw do
  root 'users#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :posts
  end

end

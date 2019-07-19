Rails.application.routes.draw do
  root 'user#new'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :posts
end

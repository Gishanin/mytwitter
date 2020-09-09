Rails.application.routes.draw do
  devise_for :users
 
  root to: 'home#index'

  resources :posts
  resources :users
  resource :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

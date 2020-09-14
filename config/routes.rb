Rails.application.routes.draw do
  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  root to: 'home#index'

  resources :posts do
    resource :likes, only: [:create, :destroy]
  end
  resources :users
  resource :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

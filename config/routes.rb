Rails.application.routes.draw do
  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  root to: 'home#index'

  resources :posts do
    resource :likes, only: %i[create destroy]
  end
  resources :users
  post '/users/:id/follow', to: 'users#follow', as: 'follow_user'
  post '/users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'

  get '/profile', to: 'profile#show'
  get '/profile/:id/edit', to: 'profile#edit', as: :edit_profile
  patch '/profile/:id', to: 'profile#update'

  get '/profiles', to: 'profiles#index', as: :user_profiles
  get '/profiles/:id', to: 'profiles#show', as: :user_profile

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

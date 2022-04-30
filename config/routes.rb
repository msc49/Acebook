Rails.application.routes.draw do
  devise_for :users
  get 'search', to: "users#search"
  match '/users',   to: 'users#index',   via: 'get'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index" 
  resources :friendships
  resources :posts do
    resources :comments
    resources :likes
  end
end

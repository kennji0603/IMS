Rails.application.routes.draw do
  resources :dashboard, only: :index
  namespace :dashboard do
    resources :items, except: [:show]
  end

  devise_for :users
  root to: 'items#index'
  resources :users, only: :show
  get 'cart', to: 'shopping_carts#index'
  post 'cart/create', to: 'shopping_carts#create'
  delete 'cart', to: 'shopping_carts#destroy'
  resources :items, only: [:index, :show]
end

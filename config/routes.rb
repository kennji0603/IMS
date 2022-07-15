Rails.application.routes.draw do
  resources :dashboard, only: :index
  namespace :dashboard do
    resources :items, except: :show
    resources :users, only: :index 
    resources :orders, only: :index
  end

  devise_for :users
  root to: 'items#index'
  resources :users, only: :show do
    collection do
      get 'cart', to: 'shopping_carts#index'
      post 'cart/create', to: 'shopping_carts#create'
      delete 'cart', to: 'shopping_carts#destroy'
      get 'cart_history_index'
      get 'cart_history_show/:num', to: "users#cart_history_show", as: "cart_history"
    end
  end
  
  resources :items, only: [:index, :show]
end

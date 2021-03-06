Rails.application.routes.draw do
  resources :dashboard, only: :index
  namespace :dashboard do
    resources :items, except: :show
    resources :users, only: :index 
  end

  devise_for :users
  root to: 'items#index'
  resources :users, only: :show do
    collection do
      get 'cart_history_index'
      get 'cart_histpry_show'
    end
  end
  get 'cart', to: 'shopping_carts#index'
  post 'cart/create', to: 'shopping_carts#create'
  delete 'cart', to: 'shopping_carts#destroy'
  resources :items, only: [:index, :show]
end

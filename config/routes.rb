Rails.application.routes.draw do
 
  devise_for :users
  root to: 'items#index'
  get 'users/mypage', to: 'users#mypage'
  get 'cart', to: 'shopping_carts#index'
  post 'cart/create', to: 'shopping_carts#create'
  delete 'cart', to: 'shopping_carts#destroy'
  resources :items, only: [:index, :show]
end

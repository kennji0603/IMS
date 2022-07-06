Rails.application.routes.draw do
 
  devise_for :users
  root to: 'items#index'
  get 'users/mypage', to: 'users#mypage'
end

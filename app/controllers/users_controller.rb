class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def cart_history_index
    @orders = ShoppingCart.search_bought_carts_by_user(current_user)
  end

  def cart_history_show
   
    @cart = ShoppingCart.find(params[:num])
    @cart_items = ShoppingCartItem.user_cart_items(@cart.id)
  end

 
  

  
end

class ShoppingCartsController < ApplicationController
  before_action :set_cart, only: [:index, :create, :destroy]

  def index
    @user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
  end

  def show
    @cart = ShoppingCart.find(user_id: current_user)
  end

  def create
    @item = Item.find(item_params[:item_id])
    @user_cart.add(@item, item_params[:price].to_i, item_params[:quantity].to_i)
    redirect_to cart_path
  end
 
  def update
  end

  def destroy
    @user_cart.buy_flag = true
    @user_cart.save
    redirect_to cart_url
  end
  private
    def set_cart
      @user_cart = ShoppingCart.set_user_cart(current_user)
    end

    def item_params
      params.permit(:item_id, :price, :quantity)
    end
end

class Dashboard::OrdersController < ApplicationController
  before_action :authenticate_user!
  layout  "dashboard/dashboard"

  def index
    @orders = ShoppingCart.bought_carts
  end
end

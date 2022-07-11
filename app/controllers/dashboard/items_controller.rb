class Dashboard::ItemsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard/dashboard"
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to dashboard_items_path
    end
  end

  private

  def item_params
    params.require(:item).require(:name, :price, :image)
  end
end

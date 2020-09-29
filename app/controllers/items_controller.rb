class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:user, :product_name, :description, :category_id, :condition_id, :delivery_fee_id, :delivery_area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end

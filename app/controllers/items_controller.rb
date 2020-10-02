class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:user, :product_name, :description, :category_id, :condition_id, :delivery_fee_id, :delivery_area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end

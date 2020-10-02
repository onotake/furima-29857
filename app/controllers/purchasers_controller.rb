class PurchasersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  def purchaser_params
    params.require(:purchaser).permit(:item_id).merge(user_id: current_user.id)
  end
end


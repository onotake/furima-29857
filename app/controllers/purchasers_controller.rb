class PurchasersController < ApplicationController
  before_action :authenticate_user!
  before_action :prevent, only: :index
  before_action :set_item, only: [:index, :create]
  

  def index
    @purchaser = PurchaserAddress.new
  end

  def create
    @purchaser = PurchaserAddress.new(purchaser_params)
    if @purchaser.valid?
      pay_item
      @purchaser.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchaser_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent 
    @item = Item.find(params[:item_id])
    if @item.purchaser.present?
      redirect_to root_path
    elsif @item.user == current_user
      redirect_to root_path
    end
  end
end


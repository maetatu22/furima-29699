class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id]) 
    @order = BuyerAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order = BuyerAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :area_id, :municipality, :block_number, :building_name, :phone_number, :item_id, :buyer_id, :token).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy' 
    )
  end

end

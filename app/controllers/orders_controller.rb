class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_action, only: [:index, :create] 

  def index
    @order = BuyerAddress.new
    redirect_action
  end


  def create
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
  
  def set_action
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy' 
    )
  end

  def redirect_action
    if @item.buyer != nil || (user_signed_in? && current_user.id == @item.user_id)
      redirect_to root_path
    end
  end

end

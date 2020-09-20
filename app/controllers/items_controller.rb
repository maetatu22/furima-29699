class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shipping_cost_id, :area_id, :shipping_time_id, :price ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      authenticate_user!
    end
  end


end

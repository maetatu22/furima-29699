class ItemsController < ApplicationController
  def index
    
  end

  def new
  end

  def create
  end

  private

  def message_params
    params.reauire(:item).permit(:image)
end

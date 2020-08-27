class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :sipping_id, :sipping_origin_id, :sipping_date_id, :price).merge(user_id: current_user.id)
  end
end
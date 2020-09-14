class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :image, :name, :description, :price, :status_id, :shipping_method_id, :shipping_origin_area_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end

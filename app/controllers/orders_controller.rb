class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
 
  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  # def item_params
  #   params.require(:item).permit(:category_id, :image, :name, :description, :price, :status_id, :shipping_method_id, :shipping_origin_area_id, :shipping_days_id).merge(user_id: current_user.id)
  # end

  def order_params
    params.permit(:price, :token)
  end
 
  def pay_item
    Payjp.api_key = "sk_test_XXXXXXXX"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
 
 end
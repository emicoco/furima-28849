class OrdersController < ApplicationController
  before_action :show_params, only: [:index, :create] 
  before_action :order_index, only: [:index, :create] 

  def index
    @item = Item.find(params[:item_id])
    @buyer = Token.new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @buyer = Token.new(order_params)
    if @buyer.valid?
      pay_item
      @buyer.save
        redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def show_params
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def order_index
    if @item.purchase_management.present?
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:token, :item_id, :post_number, :shipping_origin_area_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id,item_id: @item.id)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
 
 end
class OrdersController < ApplicationController
  before_action :set_item
  before_action :correct_user, only: :index
  before_action :ordered_item, only: :index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:token, :item_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
   )
  end

  def correct_user
    unless user_signed_in?
      return redirect_to root_path
    end
    if user_signed_in? && @item.user_id == current_user.id
      return redirect_to root_path
    end
  end

  def ordered_item
    @order = Order.find_by(item_id: @item.id )
    redirect_to root_path if @order
  end
end

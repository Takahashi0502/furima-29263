class OrdersController < ApplicationController
  before_action :set_item
  before_action :correct_user, only: :index
  before_action :ordered_item, only: :index

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      binding.pry
      pay_item
      @order.save
      binding.pry
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
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone_num).merge( token: params[:token], item_id: params[:item_id], user_id: current_user.id )
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

class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @items = Item.all.order(created_at: "DESC")
    @orders = Order.includes(:item)
  end

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

  def show
    @item = Item.find(params[:id])
    @orders = Order.includes(:item)
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :info, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :price
    ).merge(user: current_user)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end

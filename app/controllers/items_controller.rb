class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :price).merge(user: current_user )
  end
  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end

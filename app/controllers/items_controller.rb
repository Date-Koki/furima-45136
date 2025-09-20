class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      @item = Item.new(item_params)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :status_id, :price, :shipping_fee_id,
                                 :prefecture_id, :delivery_time_id).merge(user_id: current_user.id)
  end
end

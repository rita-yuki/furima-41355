class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
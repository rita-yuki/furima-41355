class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller_or_sold_out, only: [:index, :create]

  def index
    @item = @item
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller_or_sold_out
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :municipality, :block, :building_name,:telephone_number, :price).merge(user_id: current_user.id).merge(
    user_id: current_user.id,
    item_id: @item.id
    )
  end
end
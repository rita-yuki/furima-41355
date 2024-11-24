class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
    set_form_data
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      set_form_data
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :product_status_id, :shipping_fee_id, :prefecture_id,
                                 :days_up_to_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_form_data
    @categories = Category.all
    @product_statuses = ProductStatus.all
    @shipping_fees = ShippingFee.all
    @prefectures = Prefecture.all
    @days_up_to_deliveries = DaysUpToDelivery.all
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_seller, only: [:edit, :update]
  before_action :redirect_if_sold, only: [:edit, :update]

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
      redirect_to item_path(@item.id)
    else
      set_form_data
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    set_form_data
  end

  def update
    params[:item].delete(:image) if params[:item][:image].blank?

    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      set_form_data
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy if current_user == @item.user
    redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_not_seller
    redirect_to root_path unless current_user == @item.user
  end

  def redirect_if_sold
    redirect_to root_path if @item.sold_out?
  end
end

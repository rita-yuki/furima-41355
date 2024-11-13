class ItemsController < ApplicationController
 before_action :authenticate_user!, only: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

end

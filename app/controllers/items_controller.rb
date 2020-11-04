class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def  new
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

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :url, :stock_quantity, :standard_inventory, :ordering_unit, :price, :place, :image)
  end
  
end

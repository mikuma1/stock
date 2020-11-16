class ItemsController < ApplicationController
  before_action :move_to_organization_login
  before_action :set_organization
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.where(organization_id: @organization.id)
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

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :url, :stock_quantity, :standard_inventory, :ordering_unit, :price, :place, :image, :organization_id)
  end

  def set_organization
    if params[:id]
      @organization = Organization.find(params[:id])
    elsif user_signed_in?
      @organization = Organization.find(current_user.organization_id)
    else
      redirect_to login_path
    end
  end

  def move_to_organization_login
    redirect_to login_path unless current_organization?(@organization)
  end
  
end

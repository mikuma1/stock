class ItemsController < ApplicationController
  before_action :move_to_organization_login
  before_action :set_organization
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to organization_item_path(organization_id: params[:organization_id], id: params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path(id: @organization.id)
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :url, :stock_quantity, :standard_inventory, :ordering_unit, :price, :place, :image, :organization_id)
  end

  def set_organization
    if user_signed_in?
      @organization = Organization.find(current_user.organization_id)
    elsif params[:id]
      @organization = Organization.find(params[:id])
    else
      redirect_to login_path
    end
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_organization_login
    redirect_to login_path unless current_organization?(@organization)
  end

end

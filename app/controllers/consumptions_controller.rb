class ConsumptionsController < ApplicationController
  before_action :set_organization, only: [:index, :create]

  def index
    @consumptions = Consumption.where(organization_id: @organization.id)
  end

  def create
    item = Item.find(params[:consumption][:item_id])
    @consumption = Consumption.new(consumption_params)
    if @consumption.save
      item.stock_quantity -= params[:consumption][:quantity].to_f
      item.save
    end
    redirect_to root_path
  end

  def approval
    consumption = Consumption.find(params[:consumption_id])
    consumption.update(approval: true)
    item = Consumption.find(params[:consumption_id])
    render json: { consumption: item }
  end

  private

  def consumption_params
    params.require(:consumption).permit(:quantity, :item_id).merge(user_id: current_user.id, organization_id: @organization.id, approval: false)
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
end

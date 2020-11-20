class ConsumptionsController < ApplicationController
  def new
    @consumption = Consumption.new
  end

  def create
    item = Item.find(params[:id])
    @consumption = Consumption.new(consumption_params)
  end
  
  private
  def consumption_params
    params.require(consumption).permit(:quantity).merge(item: item.id, user: current_user.id)
  end
  
end

class ConsumptionsController < ApplicationController
  def create
    item = Item.find(params[:consumption][:item_id])
    @consumption = Consumption.new(consumption_params)
    if @consumption.save
      item.stock_quantity -= params[:consumption][:quantity].to_f
      item.save
    end
    redirect_to root_path
  end
  
  private
  def consumption_params
    params.require(:consumption).permit(:quantity, :item_id).merge(user_id: current_user.id)
  end
end

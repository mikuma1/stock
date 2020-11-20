class OrdersController < ApplicationController
  def create
    item = Item.find(params[:order][:item_id])
    item.stock_quantity += params[:order][:quantity].to_f
    item.save
    @order = Consumption.new(order_params)
    @order.save
    redirect_to root_path
  end
  
  private
  def order_params
    params.require(:order).permit(:quantity, :item_id).merge(user_id: current_user.id)
  end
end

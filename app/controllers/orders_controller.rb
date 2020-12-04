class OrdersController < ApplicationController
  def create
    item = Item.find(params[:order][:item_id])
    @order = Order.new(order_params)
    if @order.save
      item.stock_quantity += params[:order][:quantity].to_f
      item.save
    end
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :item_id).merge(user_id: current_user.id)
  end
end

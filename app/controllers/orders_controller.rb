class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to root_url, notice: '注文に成功しました。'
    else
      render :confirm, notice: '注文に失敗しました。'
    end
  end

  def order_params
    params.require(:order).permit(:total_price, :subtotal, :tax_fee, :cash_on_delivery, :delivery_fee)
  end
end

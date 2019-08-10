class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(1)
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.user_name = current_user.address.name
    @order.user_location = current_user.address.location
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

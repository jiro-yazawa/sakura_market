class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = Form::Order.new
    @order_details = @order.set_order_details(current_user.cart)
  end

  def create
    @order = Form::Order.new(order_params)
    # TODO コントローラー側でやるべきではない
    @order.user_id = current_user.id
    @order.user_name = current_user.address.name
    @order.user_location = current_user.address.location
    if @order.save
      # TODO ショッピングカートを空にする
      redirect_to root_url, notice: '注文に成功しました。'
    else
      redirect_to cart_url, notice: '注文に失敗しました。'
    end
  end

  def order_params
    params.require(:form_order).permit(Form::Order::REGISTRABLE_ATTRIBUTES + [order_details_attributes: Form::OrderDetail::REGISTRABLE_ATTRIBUTES])
  end

end

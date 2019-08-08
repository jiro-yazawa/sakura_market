class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def confirm
    @cart = current_user.cart
  end

  def create
    @purchase = current_user.purchase.new(purchase_params)
  end

  def purchase_params
    params.require(:purchase).permit(:total_price, :subtotal, :tax_fee, :delivery_commission, :delivery_fee, :delivery_date, :delivery_timezone)
  end
end

class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user_cart
    @order = current_user.orders.build
  end

end

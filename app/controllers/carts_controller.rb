class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_cart
    @purchase = current_user.purchases.build
  end

end

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :set_cart_items


  def show
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def set_cart_items
    @cart_items = @cart.cart_items
  end

end

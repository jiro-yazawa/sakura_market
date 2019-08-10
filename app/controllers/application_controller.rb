class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:current_cart]

  helper_method :current_user_cart
  helper_method :current_address

  def current_user_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else
      @cart = Cart.new(user_id: current_user.id)
    end
  end

  def current_user_address
    if current_user.address.present?
      @address = current_user.address
    else
      @address = Address.new(user_id: current_user.id)
    end
  end
end

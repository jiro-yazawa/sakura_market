class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:current_cart]

  helper_method :current_cart
  helper_method :current_address

  def current_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else
      @cart = Cart.create(user_id: current_user.id)
    end
  end

  def current_address
    if current_user.address.present?
      @address = current_user.address
    else
      @address = Address.create(user_id: current_user.id)
    end
  end
end

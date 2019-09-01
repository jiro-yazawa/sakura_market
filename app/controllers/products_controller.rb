class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user&.admin?
      @products = Product.all.order(:position)
    else
      @products = Product.showable.order(:position)
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = current_user.cart.cart_items.build
  end

end

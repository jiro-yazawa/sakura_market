class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.visible
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

end

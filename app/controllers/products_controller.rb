class ProductsController < ApplicationController

  def index
    if current_user&.admin?
      @products = Product.all.order(:position)
    else
      @products = Product.showable.order(:position)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end

class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :admin_user, only: [:new, :create, :destoroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to new_product_url, notice: "商品「#{@product.name}」を登録しました。"
    else
      render :new, notice: "商品の登録に失敗しました。"
    end
  end

  def destroy

  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :price, :description, :hidden, :display_order)
  end

  def admin_user
    if !current_user.admin?
      redirect_to root_url
    end
  end

end

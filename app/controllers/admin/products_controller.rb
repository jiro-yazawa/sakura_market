class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  before_action :set_product, only: [:destroy, :move]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to new_admin_product_url, notice: "商品「#{@product.name}」を登録しました。"
    else
      render :new, notice: "商品の登録に失敗しました。"
    end
  end

  def destroy
    @product.destroy!
    redirect_to root_url, notice: "商品「#{@product.name}」を削除しました。"
  end

  def move
    case params[:move]
    when 'up'
      @product.move_higher
      @target = @product.lower_item
    when 'down'
      @product.move_lower
      @target = @product.higher_item
    else
      return head :ok
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :price, :description, :hidden, :display_order)
  end

  def admin_user
    unless current_user.admin?
      redirect_to root_url
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end

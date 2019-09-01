class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_up_cart_item, only: [:create]
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    if @cart_item.save
      @notice = "カートに追加しました。"
    else
      @notice = "カートに追加できませんでした。"
    end
    redirect_to cart_url, notice: @notice
  end

  # def update
  # end

  def destroy
    @cart_item.destroy!
    redirect_to cart_url, notice: "商品をカートから削除しました。"
  end

  private 

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

  def set_cart
    @cart = current_user.cart
  end

  def set_cart_item
    @cart_item = @cart.cart_items.find(params[:id])
  end

  def set_up_cart_item
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
    @cart_item.inc_quantity(cart_item_params[:quantity])
  end

end

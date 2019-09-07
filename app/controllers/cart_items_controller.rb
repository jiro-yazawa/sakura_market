class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    @cart_item = current_user.cart.cart_items.build(cart_item_params)

    if @cart_item.save
      redirect_to cart_url, notice: "カートに追加しました。"
    else
      redirect_to product_url(@cart_item.product), notice: "カートに追加できませんでした。"
    end
  end

  # def update
  # end

  def destroy
    @cart_item.destroy!
    redirect_to cart_url, notice: "商品をカートから削除しました。"
  end

  private 

  def cart_item_params
    params.require(:cart_item).permit(:quantity).merge(product_id: params[:product_id])
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end

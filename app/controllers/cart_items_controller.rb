class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_up_cart_item

  def create
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id], quantity: 0)
    end

    @cart_item.quantity += params[:quantity].to_i
    if @cart_item.save!
      @notice = "カートに追加しました。"
    else
      @notice = "カートに追加できませんでした。"
    end
    redirect_to cart_url, notice: @notice
  end

  def update
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    @cart_item.destroy!
    redirect_to cart_url, notice: "商品をカートから削除しました。"
  end

  private 

  def set_up_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

end

class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :product

  def set_order_detail_attributes(cart_item)
    self.product= cart_item.product
    self.unit_price = cart_item.product.price
    self.quantity = cart_item.quantity
    self.subtotal = calculate_subtotal
  end

  private

  def calculate_subtotal
    unit_price * quantity
  rescue
    0
  end

end

class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :product

  def calculate_subtotal
    self.subtotal = unit_price * quantity
  rescue
    self.subtotal = 0
  end

  def set_order_detail_attributes(cart_item)
    self.product= cart_item.product
    self.unit_price = cart_item.product.price
    self.quantity = cart_item.quantity
    calculate_subtotal
  end

end

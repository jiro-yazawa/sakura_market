class Form::OrderDetail < OrderDetail
  REGISTRABLE_ATTRIBUTES = %i(id product_id unit_price quantity _destroy)
  
  def calculate_order_detail_subtotal
    self.subtotal = unit_price * quantity
  rescue
    self.subtotal = 0
  end

  def set_order_detail_attributes(cart_item)
    self.product_id = cart_item.product.id
    self.unit_price = cart_item.product.price
    self.quantity = cart_item.quantity
    self.subtotal = unit_price * quantity
  end
end

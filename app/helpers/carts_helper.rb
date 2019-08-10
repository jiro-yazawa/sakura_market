module CartsHelper
  def cart_items_subtotal
    subtotal = 0
    current_user_cart.cart_items.each do |item|  
      subtotal += item.product.price * item.quantity
    end
    subtotal
  end
end

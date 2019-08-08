module CartsHelper
  def cart_items_subtotal
    subtotal = 0
    current_user.cart.cart_items.each do |item|  
      subtotal += item.item.price * item.quantity
    end
    subtotal
  end
end

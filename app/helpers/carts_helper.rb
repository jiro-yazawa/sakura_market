module CartsHelper

  # TODO: (cart)を引数に渡すならモデルに実装した方が良いかも
  def cart_items_subtotal
    subtotal = 0
    current_user_cart.cart_items.each do |item|
      subtotal += item.product.price * item.quantity
    end
    subtotal
  end

  def delivery_fee(cart)
    base_fee = 600
    if cart.item_total_quantity == 0
      0
    else
      base_fee + (cart.item_total_quantity / 5) * base_fee
    end
  end

  def cash_on_delivery(cart)
    total = CashOnDelivery.fee_by(cart.total_price)
  end

  def tax_fee(cart)
    sum = cart_items_subtotal + delivery_fee(cart) + cash_on_delivery(cart)
    (sum * Tax.where("active_date_begin <= ?", Date.today).where("? <= active_date_end", Date.today).first.rate.to_f).to_i
  end

  def total_price(cart)
    cart_items_subtotal + delivery_fee(cart) + cash_on_delivery(cart) + tax_fee(cart)
  end
end

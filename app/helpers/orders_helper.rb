module OrdersHelper
  def delivery_fee(cart)
    base_fee = 600
    if cart.item_total_quantity == 0
      0
    else
      base_fee + (cart.item_total_quantity / 5) * base_fee
    end
  end
end

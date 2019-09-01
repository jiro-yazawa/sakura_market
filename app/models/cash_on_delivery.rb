class CashOnDelivery < ApplicationRecord

  def self.applied_fee(subtotal)
    where("orders_total_price_begin <= ? AND ? <= orders_total_price_end", subtotal, subtotal).first.fee
  end

end

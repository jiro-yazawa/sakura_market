class CashOnDelivery < ApplicationRecord
  def self.fee_by(total_price)
    self.where("orders_total_price_begin <= ?", total_price).where("? <= orders_total_price_end", total_price).first.fee
  end
end

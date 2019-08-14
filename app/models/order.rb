class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  def subtotal
    self.order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end

  def cash_on_delivery
    CashOnDelivery.where("orders_total_price_begin <= ?", subtotal).where("? <= orders_total_price_end", subtotal).first.fee
  end

  def delivery_fee
    base_fee = 600
    if self.order_details.size.zero?
      0
    else
      total_quantity = self.order_details.inject(0) { |sum, order_item| sum + order_item.quantity}
      base_fee + (total_quantity / 5) * base_fee
    end
  end
  
  def tax_fee
    sum = subtotal + cash_on_delivery + delivery_fee
    (sum * Tax.where("active_date_begin <= ?", Date.today).where("? <= active_date_end", Date.today).first.rate.to_f).to_i
  end

  def total_price
    subtotal + cash_on_delivery + delivery_fee + tax_fee
  end
end

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  def subtotal
    self.order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end

  def cash_on_delivery
    # TODO: CashOnDelivery.where をモデルに実装
    CashOnDelivery.where("orders_total_price_begin <= ? AND ? <= orders_total_price_end", subtotal, subtotal).first.fee
  end

  def delivery_fee
    base_fee = 600
    if self.order_details.size.zero?
      0
    else
      base_fee + (total_quantity / 5) * base_fee
    end
  end
  
  def tax_fee
    now = Date.today
    # TODO: Tax.where をモデルに実装
    (amount_without_tax * Tax.where("active_date_begin <= ? AND ? <= active_date_end", now, now).first.rate.to_f).to_i
  end

  def total_price
    amount_without_tax + tax_fee
  end

  def set_order_details(cart)
    cart.cart_items.each do |cart_item|
      self.order_details.build.set_order_detail_attributes(cart_item)
    end
    self.order_details
  end

  def set_user_params(user)
    self.user_id = user.id
    self.user_name = user.address.name
    self.user_location = user.address.location
  end

  private

  def amount_without_tax
    subtotal + cash_on_delivery + delivery_fee
  end

  def total_quantity
    self.order_details.inject(0) { |sum, order_item| sum + order_item.quantity}
  end

end

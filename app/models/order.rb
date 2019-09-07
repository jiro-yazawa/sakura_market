class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  after_initialize :build_order_details
  before_save :set_user_params
  after_save :clear_cart_items

  scope :recent, -> { order(id: :desc) }

  def subtotal
    self.order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end

  def cash_on_delivery
    CashOnDelivery.applied_fee(subtotal)
  end

  def delivery_fee
    DeliveryFee.calculate_by_order(self)
  end

  def tax_fee
    float_tax_fee = amount_without_tax * Tax.active_rate(Date.today)
    float_tax_fee.to_i
  end

  def amount_without_tax
    subtotal + cash_on_delivery + delivery_fee
  end

  def total_price
    amount_without_tax + tax_fee
  end

  def total_quantity
    self.order_details.inject(0) { |sum, order_item| sum + order_item.quantity}
  end

  private

  def build_order_details
    self.user.cart.cart_items.each do |cart_item|
      self.order_details.build.set_order_detail_attributes(cart_item)
    end
    self.order_details
  end

  def clear_cart_items
    self.user.cart.clear_items
  end

  def set_user_params
    user = User.find(self.user.id)
    self.user_name = user.address.name
    self.user_location = user.address.location
  end

end

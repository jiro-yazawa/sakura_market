class Form::Order < Order
  REGISTRABLE_ATTRIBUTES = %i(user_id user_name user_location total_price subtotal tax_fee cash_on_delivery delivery_fee delivery_date delivery_timezone)
  has_many :order_details, class_name: 'Form::OrderDetail'

  # after_initialize {order_details.build unless self.persisted? || order_details.present?}
  before_validation :calculate_order_subtotal

  def calculate_order_subtotal
    order_details.each(&:calculate_order_detail_subtotal)
    self.subtotal = order_details.map(&:subtotal).sum
  end

  def set_order_details(cart)
    cart.cart_items.each do |cart_item|
      self.order_details.build.set_order_item_attributes(cart_item)
    end
    self.order_details
  end

end

class Form::Order < Order
  REGISTRABLE_ATTRIBUTES = %i(user_id user_name user_location total_price subtotal tax_fee cash_on_delivery delivery_fee delivery_date delivery_timezone)
  has_many :order_details, class_name: 'Form::OrderDetail'

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

  def set_user_params(user)
    self.user_id = user.id
    self.user_name = user.address.name
    self.user_location = user.address.location
  end
end

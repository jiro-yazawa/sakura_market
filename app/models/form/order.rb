class Form::Order < Order
  REGISTRABLE_ATTRIBUTES = %i(user_id user_name user_location total_price subtotal tax_fee cash_on_delivery delivery_fee derivery_date delivery_timezone)
  has_many :order_details, class_name: 'Form::OrderDetail'

  after_initialize {order_details.build unless self.persisted? || order_details.present?}
  before_validation :calculate_order_price

  def calculate_order_price
    order_details.each(&:calculate_order_detail_price)
    self.price = order_details.map(&:price).sum
  end
end

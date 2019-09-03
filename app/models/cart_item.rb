class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save :integrate_quantity

  scope :recent, -> { order(id: :desc) }

  attribute :quantity, :integer, default: 0

  def inc_quantity(quantity)
    self.quantity += quantity.to_i
  end

  private

  def integrate_quantity # TODO: ここレビューで見て欲しい！
    others = self.class.where("cart_id = ? AND product_id = ?", self.cart, self.product)
    inc_quantity(others.inject(0) { |sum, cart_item| sum + cart_item.quantity})
    others.delete_all
  end

end

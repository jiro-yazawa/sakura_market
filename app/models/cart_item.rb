class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  attribute :quantity, :integer, default: 0

  def inc_quantity(quantity)
    self.quantity += quantity.to_i
  end

end

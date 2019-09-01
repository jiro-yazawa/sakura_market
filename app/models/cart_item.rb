class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  attribute :quantity, :integer, default: 0

  def inc_quantity(quantity)
    if self.quantity.zero?
      self.quantity = quantity.to_i
    else
      self.quantity += quantity.to_i
    end
  end

end

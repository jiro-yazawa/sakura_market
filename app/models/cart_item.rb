class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  attribute :quantity, :integer, default: 0
end

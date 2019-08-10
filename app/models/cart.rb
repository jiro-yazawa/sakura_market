class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def total_price
    total = 0
    self.cart_items.each do |item|
      total += item.product.price * item.quantity
    end
    total
  end

  def item_total_quantity
    self.cart_items.inject(0) {|sum, hash| sum + hash[:quantity]}
  end
end

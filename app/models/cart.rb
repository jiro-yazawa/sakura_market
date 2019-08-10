class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def item_total_quantity
    self.cart_items.inject(0) {|sum, hash| sum + hash[:quantity]}
  end
end

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  def clear_items
    self.cart_items.delete_all
  end
end

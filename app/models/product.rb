class Product < ApplicationRecord
  acts_as_list
  has_many :cart_items, dependent: :destroy
  has_many :order_details
end

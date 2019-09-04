class Product < ApplicationRecord
  acts_as_list
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  validates :name, presence: true
  validates :price, presence: true

  scope :visible, -> { where(hidden: false) }
end

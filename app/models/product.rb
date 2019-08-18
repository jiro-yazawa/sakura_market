class Product < ApplicationRecord
  acts_as_list
  has_many :order_details
end

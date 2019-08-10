class Tax < ApplicationRecord

  scope :active, ->(date) { where("active_date_begin <= :date AND :date <= active_date_end") }
end

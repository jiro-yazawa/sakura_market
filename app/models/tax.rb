class Tax < ApplicationRecord

  scope :active, ->(date) { where("active_date_begin <= ? AND ? <= active_date_end", date, date) }

  def self.active_rate(target_date)
    active(target_date).first.rate.to_f
  end
end

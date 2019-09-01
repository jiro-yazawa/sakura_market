class DeliveryFee
  # TODO: ActiveRecordを継承しないモデルはmodels/に置いといて良いのか

  BASE_FEE = 600

  def self.calculate_by_order(order)
    total_quantity = order.total_quantity
    if total_quantity.zero?
      0
    else
      BASE_FEE + (total_quantity / 5) * BASE_FEE
    end
  end
end

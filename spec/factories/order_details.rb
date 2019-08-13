FactoryBot.define do
  factory :order_detail do
    order { nil }
    product { nil }
    unit_price { 1 }
    quantity { 1 }
    subtotal { 1 }
  end
end

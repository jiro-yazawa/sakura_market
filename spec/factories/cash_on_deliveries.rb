FactoryBot.define do
  factory :cash_on_delivery do
    fee { 1 }
    orders_total_price_begin { 1 }
    orders_total_price_end { 1 }
  end
end

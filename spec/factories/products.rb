FactoryBot.define do
  factory :product do
    name { 'Apple' }
    image { nil }
    price { 100 }
    description { 'Sweety Apple' }
    hidden { false }
    position { 1 }
  end
end
require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with name and price" do
    product = Product.new(
      name: "Apple",
      image: nil,
      price: 300,
      description: nil,
      hidden: nil,
      position: nil
    )

    expect(product).to be_valid
  end
end

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

  it "is invalid without name" do
    product = Product.new(
      name: nil,
      image: nil,
      price: 300,
      description: nil,
      hidden: nil,
      position: nil
    )

    expect(product).to be_invalid
  end

  it "is invalid without price" do
    product = Product.new(
      name: "Apple",
      image: nil,
      price: nil,
      description: nil,
      hidden: nil,
      position: nil
    )

    expect(product).to be_invalid
  end

  it "returns products which hidden param is false" do
    product1 = FactoryBot.build(:product)
    product2 = FactoryBot.build(:product)
    product3 = FactoryBot.build(:product)
    product1[:hidden] = false
    product2[:hidden] = true
    product3[:hidden] = true
    product1.save
    product2.save
    product3.save

    expect(Product.showable).not_to include(product2, product3)
    expect(Product.showable).to include(product1)
  end


end

class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :comments
  has_many :orders
  has_many :notes

  after_create :create_user_address, :create_user_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImagesUploader

  private

  def create_user_address
    self.address = Address.create(user_id: id)
  end

  def create_user_cart
    self.cart = Cart.create(user_id: id)
  end
end

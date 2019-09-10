class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :comments
  has_many :orders
  has_many :notes

  before_create :build_user_address, :build_user_cart

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImagesUploader

  private

  def build_user_address
    self.build_address
  end

  def build_user_cart
    self.build_cart
  end
end

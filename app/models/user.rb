class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_user_address
  mount_uploader :image, ImagesUploader

  private

  def create_user_address
    self.address = Address.create(user_id: id)
  end
end

class Note < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :contents, presence: true
  mount_uploader :image, ImagesUploader

  scope :recent, -> { order(created_at: :desc) }
end

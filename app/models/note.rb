class Note < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :contents, presence: true

  scope :recent, -> { order(created_at: :desc) }
end

class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user

  has_many :likes, dependent: :destroy

  mount_uploaders :review_images, ReviewImageUploader

  validates :body, length: { maximum: 65_535 }
  validates :rate, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
end

class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user

  has_many :review_likes, dependent: :destroy

  mount_uploaders :review_images, ReviewImageUploader

  validates :body, length: { maximum: 65_535 }
  validates :rate, presence: true, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  FILE_NUMBER_LIMIT = 1
  validate :validate_number_of_files

  def validate_number_of_files
    return if review_images.length <= FILE_NUMBER_LIMIT
    errors.add(:review_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end
end

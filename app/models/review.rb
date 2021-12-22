class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user
  validates :body, length: { maximum: 65_535 }
end

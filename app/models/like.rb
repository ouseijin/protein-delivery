class Like < ApplicationRecord
  belongs_to :menu, optional: true
  belongs_to :user
  belongs_to :review, optional: true

  validates :menu_id, uniqueness: { scope: [:user_id, :id] }
  validates :review_id, uniqueness: { scope: [:user_id, :id] }
end

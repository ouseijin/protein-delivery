class Like < ApplicationRecord
  belongs_to :menu
  belongs_to :user

  validates :menu_id, uniqueness: { scope: :user_id }
end

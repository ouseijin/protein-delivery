class Menu < ApplicationRecord
  belongs_to :service
  has_many :menu_likes, dependent: :destroy
end

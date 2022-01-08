class Menu < ApplicationRecord
  belongs_to :service
  has_many :likes, dependent: :destroy
end

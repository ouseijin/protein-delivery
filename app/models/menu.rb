class Menu < ApplicationRecord
  belongs_to :service
  has_many :nutrients, dependent: :destroy
  has_many :menu_likes, dependent: :destroy

  accepts_nested_attributes_for :nutrients
end

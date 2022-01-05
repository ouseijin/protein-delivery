class Service < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :reviews, dependent: :destroy
end

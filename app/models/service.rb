class Service < ApplicationRecord
  has_many :menus, dependent: :destroy
end

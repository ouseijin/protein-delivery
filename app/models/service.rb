class Service < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :reviews, dependent: :destroy

  scope :rate_rank, lambda {
                      find(Review.group(:service_id).order('sum(rate)/count(rate) desc').limit(3).pluck(:service_id))
                    }
end

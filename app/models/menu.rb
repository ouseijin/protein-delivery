class Menu < ApplicationRecord
  belongs_to :service
  has_many :nutrients, dependent: :destroy
  has_many :menu_likes, dependent: :destroy

  scope :like_rank, lambda {
                      includes(:service, :nutrients, :menu_likes)
                        .find(MenuLike.group(:menu_id).order('count(menu_id) desc').limit(5).pluck(:menu_id))
                    }
end

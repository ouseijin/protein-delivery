class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :reviews, dependent: :destroy
  has_many :menu_likes, dependent: :destroy
  has_many :good_menus, through: :menu_likes, source: :menu
  has_many :review_likes, dependent: :destroy
  has_many :good_reviews, through: :review_likes, source: :review

  mount_uploader :avatar, AvatarUploader

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 50 } # Twitterに準拠

  def own?(object)
    id == object.user_id
  end

  def menu_like(menu)
    good_menus << menu
  end

  def menu_unlike(menu)
    good_menus.destroy(menu)
  end

  def menu_like?(menu)
    menu.menu_likes.pluck(:user_id).include?(id)
  end

  def review_like(review)
    good_reviews << review
  end

  def review_unlike(review)
    good_reviews.destroy(review)
  end

  def review_like?(review)
    review.review_likes.pluck(:user_id).include?(id)
  end
end

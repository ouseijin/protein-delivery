class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_menus, through: :likes, source: :menu

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

  def like(menu)
    like_menus << menu
  end

  def unlike(menu)
    like_menus.destroy(menu)
  end

  def like?(menu)
    menu.likes.pluck(:user_id).include?(id)
  end
end

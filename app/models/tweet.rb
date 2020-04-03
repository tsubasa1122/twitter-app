class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  delegate :user_profile, to: :user
  validates :content, length: { maximum: 140 }

  has_many_attached :images

  scope :user_detail, -> { eager_load(:user, user: [user_profile: [profile_image_attachment: :blob]]) }

  def favorited_by?(user)
    favorites.where(user_id: user.id).present?
  end
end

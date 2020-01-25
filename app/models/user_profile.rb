class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image

  validates :name, presence: true, length: { in: 1..50 }
  validates :account_name, presence: true, length: { in: 1..15 }, uniqueness: true
  validates :description, length: { maximum: 160 }
  validates :location, length: { maximum: 30 }
  validates :website, length: { maximum: 100 }
  validate :file_type_image

  def file_type_image
    errors.add(:profile_image, "画像データではありません。") unless image?
  end

  def image?
    return nil unless profile_image.attached?

    %w[image/jpg image/jpeg image/png image/gif].include?(profile_image.blob.content_type)
  end

  def profile_image_url
    if profile_image.attached?
      profile_image
    else
      ActionController::Base.helpers.asset_path('mysteryman.png')
    end
  end
end

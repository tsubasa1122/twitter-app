class Tweet < ApplicationRecord
  belongs_to :user
  delegate :user_profile, to: :user
  validates :content, length: { maximum: 140 }
end
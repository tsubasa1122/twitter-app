class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy, inverse_of: :user
  has_many :tweets, dependent: :destroy
  accepts_nested_attributes_for :user_profile
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following
  has_many :favorites, dependent: :destroy

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end

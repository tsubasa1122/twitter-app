class UserProfile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 1..50 }
  validates :account_name, presence: true, length: { in: 1..15 }, uniqueness: true
  validates :description, length: { maximum: 160 }
  validates :location, length: { maximum: 30 }
  validates :website, length: { maximum: 100 }
end

class UserProfile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { in: 1..50 }
  validates :account_name, presence: true, length: { in: 1..15 }, uniqueness: true
end

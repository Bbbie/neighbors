class Profile < ApplicationRecord
  has_one :user
  has_one_attached :avatar

  validates :floor, presence: true
end

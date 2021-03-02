class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :floor, presence: true
end

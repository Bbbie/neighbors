class Community < ApplicationRecord
  validates :address, presence: true
  has_many :users
  has_many :cards, through: :users

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

class Community < ApplicationRecord
  validates :address, presence: true
  has_many :users
  has_many :cards, through: :users
end

class Profile < ApplicationRecord
  has_one :user


  validates :floor, presence: true
end

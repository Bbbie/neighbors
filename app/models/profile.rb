class Profile < ApplicationRecord
  belongs_to :users

  validates :floor, presence: true
end

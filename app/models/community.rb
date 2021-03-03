class Community < ApplicationRecord
  validates :address, presence: true
  has_many :users
  has_many :cards, through: :users

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

# PG SEARCH
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [:address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

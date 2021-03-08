class Card < ApplicationRecord
  belongs_to :user
  has_many :card_recipients
  has_many :users, through: :card_recipients
  has_many :comments
  has_many_attached :pictures
  accepts_nested_attributes_for :card_recipients

  validates :board, :category, :title, :users, presence: true
  validates :board, inclusion: { in: ['parcels', 'mutual_help', 'community'] }
  validates :category, inclusion: { in: ['action', 'request', 'info', 'offer', 'question'] }

  CARD_BOARDS = ['parcels', 'mutual_help', 'community']
  CARD_CATEGORIES = ['action', 'request', 'info', 'offer', 'question']
  CARD_CATEGORIES_PARCELS = ['info', 'question']
end

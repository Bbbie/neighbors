class Card < ApplicationRecord
  belongs_to :user
  has_many :card_recipients
  has_many :users, through: :card_recipients
  has_many :comments
  has_many_attached :pictures

  validates :board, :category, :title, presence: true
  validates :category, inclusion: { in: ['action', 'request', 'info', 'offer', 'question'] }
end

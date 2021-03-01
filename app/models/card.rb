class Card < ApplicationRecord
  belongs_to :user
  has_many :card_recipients
  has_many :comments
  has_one_attached :picture

  validates :board, :title, :description, :start_date, :start_time, :end_date, :end_time, presence: true
  validates :category, presence: true, inclusion: { in: ['action', 'request', 'info', 'offer', 'question'] }
end

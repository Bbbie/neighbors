class Comment < ApplicationRecord
  belongs_to :card
  belongs_to :user

  validates :content, presence: true
end

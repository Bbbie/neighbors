class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :community
  belongs_to :profile
  has_many :card_recipients
  has_many :cards_as_recipient, through: :card_recipients, source: :cards
  has_many :cards
  has_many :comments

  validates :first_name, :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end

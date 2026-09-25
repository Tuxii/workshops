class Participant < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :sessions, through: :registrations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

class Session < ApplicationRecord
  belongs_to :workshop
  has_many :registrations, dependent: :destroy
  has_many :participants, through: :registrations

  enum :status, { draft: 0, published: 1, full: 2, cancelled: 3 }

  validates :starts_at, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  def remaining_seats
    capacity - registrations.count
  end

  def refresh_status
    if published? && remaining_seats.zero?
      full!
    elsif full? && remaining_seats.positive?
      published!
    end
  end
end

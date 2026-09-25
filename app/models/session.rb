class Session < ApplicationRecord
  belongs_to :workshop

  enum :status, { draft: 0, published: 1, full: 2, cancelled: 3 }

  validates :starts_at, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end

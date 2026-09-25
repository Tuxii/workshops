class Workshop < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :registrations, through: :sessions
  has_many :participants, -> { distinct }, through: :registrations
  include Notable

  scope :published, -> { where(published: true) }

  validates :title, presence: true, length: { in: 3..100 }
  validates :duration_minutes, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  def formatted_duration
    return if duration_minutes.nil?

    hours, minutes = duration_minutes.divmod(60)
    return "#{minutes} min" if hours.zero?
    return "#{hours} h" if minutes.zero?

    "#{hours} h #{minutes.to_s.rjust(2, '0')}"
  end
end

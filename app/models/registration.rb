class Registration < ApplicationRecord
  belongs_to :session
  belongs_to :participant

  validates :participant_id, uniqueness: { scope: :session_id, message: "est déjà inscrit à cette session" }
  validate :session_has_seats, on: :create

  private
    def session_has_seats
      if session && session.remaining_seats <= 0
        errors.add(:session, "est complète")
      end
    end
end

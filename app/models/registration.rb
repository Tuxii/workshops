class Registration < ApplicationRecord
  belongs_to :session
  belongs_to :participant

  validates :participant_id, uniqueness: { scope: :session_id, message: "est déjà inscrit à cette session" }
  validate :session_has_seats, on: :create

  after_create :refresh_session_status
  after_destroy :refresh_session_status

  private
    def session_has_seats
      if session && session.remaining_seats <= 0
        errors.add(:session, "est complète")
      end
    end

    def refresh_session_status
      session.refresh_status
    end
end

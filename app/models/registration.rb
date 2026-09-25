class Registration < ApplicationRecord
  belongs_to :session
  belongs_to :participant

  validates :participant_id, uniqueness: { scope: :session_id, message: "est déjà inscrit à cette session" }
end

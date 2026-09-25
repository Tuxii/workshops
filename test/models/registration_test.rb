require "test_helper"

class RegistrationTest < ActiveSupport::TestCase
  test "une inscription sur une session avec des places est valide" do
    registration = Registration.new(session: sessions(:ceramics_saturday), participant: participants(:bruno))

    assert registration.valid?
  end

  test "un participant ne s'inscrit qu'une fois à une session" do
    registration = Registration.new(session: sessions(:ceramics_saturday), participant: participants(:alice))

    assert_not registration.valid?
    assert_includes registration.errors[:participant_id], "est déjà inscrit à cette session"
  end

  test "une session pleine refuse une inscription" do
    session = sessions(:ceramics_saturday)
    session.registrations.create!(participant: participants(:bruno))
    session.registrations.create!(participant: participants(:chloe))

    registration = session.registrations.build(participant: Participant.create!(name: "Denise", email: "denise@example.test"))

    assert_not registration.valid?
    assert_includes registration.errors[:session], "est complète"
  end
end

require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "s'inscrire à une session" do
    session = sessions(:ceramics_saturday)

    assert_difference("Registration.count") do
      post session_registrations_url(session), params: { participant: { name: "Denise", email: "denise@example.test" } }
    end

    assert_redirected_to session_url(session)
  end
end

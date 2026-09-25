class RegistrationsController < ApplicationController
  before_action :set_session, only: :create

  # POST /sessions/1/registrations
  def create
    @participant = Participant.find_or_initialize_by(email: participant_params[:email])
    @participant.name = participant_params[:name] if @participant.new_record?
    @registration = @session.registrations.build(participant: @participant)

    if @participant.save && @registration.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @session, notice: "Inscription de #{@participant.name} enregistrée." }
      end
    else
      errors = @participant.errors.full_messages + @registration.errors.full_messages
      redirect_to @session, alert: "Inscription impossible : #{errors.to_sentence}."
    end
  end

  # DELETE /registrations/1
  def destroy
    @registration = Registration.find(params.expect(:id))
    @session = @registration.session
    @registration.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @session, notice: "Inscription de #{@registration.participant.name} annulée.", status: :see_other }
    end
  end

  private
    def set_session
      @session = Session.find(params.expect(:session_id))
    end

    def participant_params
      params.expect(participant: [ :name, :email ])
    end
end

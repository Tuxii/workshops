class SessionsController < ApplicationController
  before_action :set_workshop, only: %i[ new create ]
  before_action :set_session, only: %i[ show edit update destroy ]

  # GET /sessions
  def index
    @sessions = Session.order(:starts_at)
  end

  # GET /sessions/1
  def show
  end

  # GET /workshops/1/sessions/new
  def new
    @session = @workshop.sessions.build
  end

  # POST /workshops/1/sessions
  def create
    @session = @workshop.sessions.build(session_params)

    if @session.save
      redirect_to @session, notice: "Session programmée."
    else
      render :new, status: :unprocessable_content
    end
  end

  # GET /sessions/1/edit
  def edit
  end

  # PATCH /sessions/1
  def update
    if @session.update(session_params)
      redirect_to @session, notice: "Session mise à jour.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy!
    redirect_to @session.workshop, notice: "Session supprimée.", status: :see_other
  end

  private
    def set_workshop
      @workshop = Workshop.find(params.expect(:workshop_id))
    end

    def set_session
      @session = Session.find(params.expect(:id))
    end

    def session_params
      params.expect(session: [ :starts_at, :capacity, :status ])
    end
end

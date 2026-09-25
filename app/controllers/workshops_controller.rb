class WorkshopsController < ApplicationController
  before_action :set_workshop, only: %i[ show edit update destroy ]

  # GET /workshops or /workshops.json
  def index
    @workshops = Workshop.order(:title)
  end

  # GET /workshops/1 or /workshops/1.json
  def show
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops or /workshops.json
  def create
    @workshop = Workshop.new(workshop_params)

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: "Atelier créé." }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @workshop.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /workshops/1 or /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to @workshop, notice: "Atelier mis à jour.", status: :see_other }
        format.json { render :show, status: :ok, location: @workshop }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @workshop.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /workshops/1 or /workshops/1.json
  def destroy
    @workshop.destroy!

    respond_to do |format|
      format.html { redirect_to workshops_path, notice: "Atelier supprimé.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def workshop_params
      params.expect(workshop: [ :title, :description, :duration_minutes, :published, :handout ])
    end
end

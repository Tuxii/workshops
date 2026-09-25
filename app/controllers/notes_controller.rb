class NotesController < ApplicationController
  before_action :set_notable

  # POST /workshops/1/notes ou /sessions/1/notes
  def create
    note = @notable.notes.build(note_params)

    if note.save
      redirect_to @notable, notice: "Note ajoutée."
    else
      redirect_to @notable, alert: "Une note ne peut pas être vide."
    end
  end

  private
    def set_notable
      if params[:workshop_id]
        @notable = Workshop.find(params[:workshop_id])
      else
        @notable = Session.find(params[:session_id])
      end
    end

    def note_params
      params.expect(note: [ :body ])
    end
end

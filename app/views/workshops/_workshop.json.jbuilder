json.extract! workshop, :id, :title, :description, :duration_minutes, :published, :created_at, :updated_at
json.url workshop_url(workshop, format: :json)

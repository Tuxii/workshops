class AddDetailsToWorkshops < ActiveRecord::Migration[8.1]
  def change
    add_column :workshops, :description, :text
    add_column :workshops, :duration_minutes, :integer
    add_column :workshops, :published, :boolean, default: false, null: false
  end
end

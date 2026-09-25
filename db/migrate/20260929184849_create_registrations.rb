class CreateRegistrations < ActiveRecord::Migration[8.1]
  def change
    create_table :registrations do |t|
      t.references :session, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true

      t.timestamps
    end
    add_index :registrations, [ :session_id, :participant_id ], unique: true
  end
end

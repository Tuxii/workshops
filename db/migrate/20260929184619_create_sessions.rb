class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions do |t|
      t.references :workshop, null: false, foreign_key: true
      t.datetime :starts_at, null: false
      t.integer :capacity, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end

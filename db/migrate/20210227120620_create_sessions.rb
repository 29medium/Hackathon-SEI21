class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :end
      t.time :pause
      t.integer :keys
      t.integer :backspace
      t.date :last_key
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end

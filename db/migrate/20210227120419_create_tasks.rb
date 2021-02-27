class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.datetime :deliver_date
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

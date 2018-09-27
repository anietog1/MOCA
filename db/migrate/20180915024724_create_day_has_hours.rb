class CreateDayHasHours < ActiveRecord::Migration[5.2]
  def change
    create_table :day_has_hours do |t|
      t.references :day, foreign_key: true, null: false
      t.references :hour, foreign_key: true, null: false

      t.timestamps
    end
  end
end

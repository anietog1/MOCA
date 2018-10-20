class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :student, foreign_key: true, null: false
      t.references :meeting, foreign_key: true, null: false

      t.timestamps
    end
  end
end

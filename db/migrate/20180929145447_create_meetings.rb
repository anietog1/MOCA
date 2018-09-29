class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :session, foreign_key: true, null: false
      t.date :date, null: false
      t.references :classroom, foreign_key: true
      t.boolean :is_canceled, null: false, default: false

      t.timestamps
    end
  end
end

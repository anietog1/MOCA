class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :term, foreign_key: true, null: false
      t.references :advisor, foreign_key: true, null: false
      t.references :day_has_hour, foreign_key: true, null: false
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end

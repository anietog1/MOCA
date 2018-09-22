class CreateSessionHasStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :session_has_students do |t|
      t.references :session, foreign_key: true, null: false
      t.references :student, foreign_key: true, null: false

      t.timestamps
    end
  end
end

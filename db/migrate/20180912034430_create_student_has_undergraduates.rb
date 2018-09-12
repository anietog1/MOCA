class CreateStudentHasUndergraduates < ActiveRecord::Migration[5.2]
  def change
    create_table :student_has_undergraduates do |t|
      t.references :student, foreign_key: true, null: false
      t.references :undergraduate, foreign_key: true, null: false

      t.timestamps
    end
  end
end

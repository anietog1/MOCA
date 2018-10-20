class CreateEnvironments < ActiveRecord::Migration[5.2]
  def change
    create_table :environments do |t|
      t.boolean :is_student_register_active, null: false, default: false
      t.boolean :is_advisors_register_active, null: false, default: false
      t.boolean :is_schedules_register_active, null: false, default: false
      t.references :semester, foreign_key: true, null: false
      t.references :month, foreign_key: true, null: false

      t.timestamps
    end
  end
end

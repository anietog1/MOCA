class RenameIsStudentRegisterActiveToIsStudentsRegisterActiveInEnvironment < ActiveRecord::Migration[5.2]
  def change
    rename_column :environments, :is_student_register_active, :is_students_register_active
  end
end

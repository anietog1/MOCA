class AddAdvisorGradeToStudents < ActiveRecord::Migration[5.2]
  def change
    change_table :students do |t|
      t.float :advisor_grade
    end
  end
end

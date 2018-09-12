class CreateAdvisorHasSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :advisor_has_subjects do |t|
      t.references :advisor, foreign_key: true, null: false
      t.references :subject, foreign_key: true, null: false

      t.timestamps
    end
  end
end

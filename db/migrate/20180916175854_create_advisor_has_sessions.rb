class CreateAdvisorHasSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :advisor_has_sessions do |t|
      t.references :advisor, foreign_key: true, null: false
      t.references :day_has_hour, foreign_key: true, null: false
      t.references :term, foreign_key: true, null: false

      t.timestamps
    end
  end
end

class CreateAdvisors < ActiveRecord::Migration[5.2]
  def change
    create_table :advisors do |t|
      t.references :student, foreign_key: true, null: false
      t.references :term, foreign_key: true, null: false
      t.boolean :is_valid

      t.timestamps
    end
  end
end

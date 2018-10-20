class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.references :session_has_student, foreign_key: true, null: false
      t.integer :satisfaction, null: false
      t.integer :contribution, null: false
      t.integer :conditions, null: false
      t.integer :domain, null: false
      t.integer :clarity, null: false
      t.integer :ability, null: false
      t.integer :treat, null: false
      t.integer :method, null: false
      t.text :fears, null: false
      t.text :changes, null: false
      t.text :comments

      t.timestamps
    end
  end
end

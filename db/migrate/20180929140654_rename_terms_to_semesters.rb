class RenameTermsToSemesters < ActiveRecord::Migration[5.2]
  def change
    remove_reference :advisors, :term
    
    drop_table :terms do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.index :name, unique: true

      t.timestamps
    end

    create_table :semesters do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.index :name, unique: true

      t.timestamps
    end

    add_reference :advisors, :semester
  end
end

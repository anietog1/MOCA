class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :first_surname, null: false
      t.string :second_surname
      t.string :university_code, null: false
      t.string :university_username, null: false
      t.string :mobile_phone, null: false
      t.boolean :is_advisor, null: false, default: false
      t.boolean :is_valid

      t.index :university_code, unique: true
      t.index :university_username, unique: true
      
      t.timestamps
    end
  end
end

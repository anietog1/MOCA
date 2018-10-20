class AddMonthToSessions < ActiveRecord::Migration[5.2]
  def change
    change_table :sessions do |t|
      t.references :month, foreign_key: true
    end

    reversible do |migration|
      migration.up do
        change_column :sessions, :month_id, :integer, null: false
      end

      migration.down do
        change_column :sessions, :month_id, :integer, null: true
      end
    end
  end
end

class RenameSurveysColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :surveys, :changes, :impact
  end
end

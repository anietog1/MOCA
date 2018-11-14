class AddSuggestionsToSubjects < ActiveRecord::Migration[5.2]
  def change
    change_table :subjects do |t|
      t.text :suggestion
    end
  end
end

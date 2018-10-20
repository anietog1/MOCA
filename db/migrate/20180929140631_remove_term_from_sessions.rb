class RemoveTermFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sessions, :term
  end
end

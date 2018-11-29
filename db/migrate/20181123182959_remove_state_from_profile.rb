class RemoveStateFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :state, :text
  end
end

class AddVisibleToStatusTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :status_types, :visible, :boolean
  end
end

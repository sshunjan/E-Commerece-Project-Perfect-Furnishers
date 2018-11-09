class AddStatusTypeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :status_type, foreign_key: true
  end
end

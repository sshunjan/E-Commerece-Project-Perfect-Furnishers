class RemoveStatusFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :status, foreign_key: true
  end
end

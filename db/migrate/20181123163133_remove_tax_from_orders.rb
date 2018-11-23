class RemoveTaxFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :tax, foreign_key: true
  end
end

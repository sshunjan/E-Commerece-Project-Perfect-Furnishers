class AddStatusTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :status_type, foreign_key: true
  end
end

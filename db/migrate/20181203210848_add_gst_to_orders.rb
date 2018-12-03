class AddGstToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :GST, :decimal
  end
end

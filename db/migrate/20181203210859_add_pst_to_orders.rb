class AddPstToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :PST, :decimal
  end
end

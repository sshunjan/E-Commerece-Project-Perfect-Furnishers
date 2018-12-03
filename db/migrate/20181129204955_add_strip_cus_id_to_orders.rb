class AddStripCusIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :stripe_cus_id, :string
  end
end

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :tax, foreign_key: true
      t.decimal :total_price
      t.string :status

      t.timestamps
    end
  end
end

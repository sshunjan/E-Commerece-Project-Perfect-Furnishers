class AddProvinceToTax < ActiveRecord::Migration[5.2]
  def change
    add_column :taxes, :province, :string
  end
end

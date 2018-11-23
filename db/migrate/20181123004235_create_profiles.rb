class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :name
      t.text :address
      t.text :city
      t.text :state
      t.integer :zip
      t.integer :phone

      t.timestamps
    end
  end
end

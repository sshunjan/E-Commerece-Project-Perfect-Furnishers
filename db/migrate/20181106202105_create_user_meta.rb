class CreateUserMeta < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meta do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :phone
      t.string :address
      t.string :email
      t.string :credit_card_number
      t.string :status

      t.timestamps
    end
  end
end

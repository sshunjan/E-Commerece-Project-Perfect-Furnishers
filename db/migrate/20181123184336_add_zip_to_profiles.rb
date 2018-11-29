class AddZipToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :zip, :string
  end
end

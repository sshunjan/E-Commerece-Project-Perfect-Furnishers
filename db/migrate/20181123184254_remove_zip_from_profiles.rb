class RemoveZipFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :zip, :integer
  end
end

class RemoveProfileFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :profile, foreign_key: true
  end
end

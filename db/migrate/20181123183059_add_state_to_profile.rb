class AddStateToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :tax, foreign_key: true
  end
end

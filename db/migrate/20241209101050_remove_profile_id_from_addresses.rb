class RemoveProfileIdFromAddresses < ActiveRecord::Migration[8.0]
  def change
    remove_reference :addresses, :profile, null: false, foreign_key: true
  end
end

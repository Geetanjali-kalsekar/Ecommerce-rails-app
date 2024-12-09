class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :colony
      t.string :city
      t.string :pincode
      t.string :country
      t.references :profile, null: false, foreign_key: true  # Make sure profile_id is correctly referenced
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

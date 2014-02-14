class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    t.string   :street
    t.string   :city
    t.string   :state
    t.string   :country
    t.string   :zip_code
    t.integer  :provider_id
    t.integer  :user_id

      t.timestamps
    end

    add_index :addresses, :provider_id
    add_index :addresses, :user_id
  end
end

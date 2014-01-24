class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :provider_id, null: false

      t.timestamps
    end
  end
end

class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :food_id
      t.integer :quantity
      t.boolean :payment

      t.timestamps
    end
  end
end

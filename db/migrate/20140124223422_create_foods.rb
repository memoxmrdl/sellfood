class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.integer :provider_id, null: false

      t.timestamps
    end
  end
end

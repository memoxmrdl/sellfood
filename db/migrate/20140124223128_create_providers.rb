class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :schedule, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end

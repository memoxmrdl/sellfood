class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.integer :schedule
      t.string :phone
      t.string :description
      t.references :account

      t.timestamps
    end

    add_index :providers, :account_id
  end
end

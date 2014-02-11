class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, :null => false, :default => ""
      t.string :status
      t.string :slug

      t.references :user

      t.timestamps
    end

    add_column :users, :status, :integer
    add_column :users, :account_id, :integer

    add_index :accounts, :user_id
  end
end

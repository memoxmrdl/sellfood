class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userame, :string
  end
end

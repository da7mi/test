class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_name, :string
  end
end

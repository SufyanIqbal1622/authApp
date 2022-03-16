class AddRoleIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role_id, :integer, null: false, default: 0
  end
end

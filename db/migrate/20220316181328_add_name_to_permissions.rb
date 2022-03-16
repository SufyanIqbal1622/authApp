class AddNameToPermissions < ActiveRecord::Migration[7.0]
  def change
    add_column :permissions, :name, :string
  end
end

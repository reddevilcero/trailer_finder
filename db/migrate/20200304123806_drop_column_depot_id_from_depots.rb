class DropColumnDepotIdFromDepots < ActiveRecord::Migration[6.0]
  def change
    remove_column :depots, :admin_id
  end
end

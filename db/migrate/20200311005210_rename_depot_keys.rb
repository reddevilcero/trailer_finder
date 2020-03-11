class RenameDepotKeys < ActiveRecord::Migration[6.0]
  def change
    rename_column :shifts, :start_depot, :start_depot_id
    rename_column :shifts, :end_depot, :end_depot_id
  end
end

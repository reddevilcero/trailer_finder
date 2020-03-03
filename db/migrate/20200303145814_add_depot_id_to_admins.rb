class AddDepotIdToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :depot_id, :integer
  end
end

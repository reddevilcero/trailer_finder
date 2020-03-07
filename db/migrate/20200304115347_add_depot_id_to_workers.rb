class AddDepotIdToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :depot_id, :integer
  end
end

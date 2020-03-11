class AddIndexesToShifts < ActiveRecord::Migration[6.0]
  def change
    add_index :shifts, :start_depot_id
    add_index :shifts, :end_depot_id
  end
end

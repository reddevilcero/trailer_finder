class AddLatestToShifts < ActiveRecord::Migration[6.0]
  def change
    add_column :shifts, :latest, :boolean, default: true
  end
end

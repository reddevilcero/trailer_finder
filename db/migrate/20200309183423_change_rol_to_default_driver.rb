class ChangeRolToDefaultDriver < ActiveRecord::Migration[5.2]
  def change
    change_column :workers, :rol, :string, :default => 'driver'
  end
end

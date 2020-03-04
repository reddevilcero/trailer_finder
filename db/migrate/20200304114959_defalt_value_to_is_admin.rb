class DefaltValueToIsAdmin < ActiveRecord::Migration[5.2]
  def change
    change_column :workers, :is_admin?, :boolean, :default => false
  end
end

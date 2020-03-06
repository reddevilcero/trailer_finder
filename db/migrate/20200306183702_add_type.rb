class AddType < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :type, :string
  end
end

class CreateTableDepot < ActiveRecord::Migration[5.2]
  def change
    create_table :depots do |t|
      t.string :name
      t.string :location
      t.integer :admin_id
      t.timestamps 
    end
  end
end

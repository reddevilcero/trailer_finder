class CreateTableShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.string :comments
      t.integer :worker_id
      t.integer :start_depot # it will be a depot_id
      t.integer :end_depot # it will ve a depot_id
      t.integer :trailer_id
      t.timestamps
    end
  end
end

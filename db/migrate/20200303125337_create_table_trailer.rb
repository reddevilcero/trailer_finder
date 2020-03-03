class CreateTableTrailer < ActiveRecord::Migration[5.2]
  def change
    create_table :trailers do |t|
      t.string :trailer_number
      t.string :make
      t.boolean :vor 
      t.date :mot_date 
      t.integer :depot_id
      t.timestamps 
    end
  end
end

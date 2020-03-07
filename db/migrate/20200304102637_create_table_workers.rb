class CreateTableWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :password_digest
      t.boolean :is_admin?
      t.string  :rol 
      t.integer :seniority
      t.string  :license
      t.timestamps
    end
  end
end

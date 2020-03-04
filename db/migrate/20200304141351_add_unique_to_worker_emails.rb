class AddUniqueToWorkerEmails < ActiveRecord::Migration[5.2]
  def change
    add_index :workers, :email, :unique => true
  end
end

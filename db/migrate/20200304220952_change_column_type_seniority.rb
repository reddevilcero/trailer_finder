class ChangeColumnTypeSeniority < ActiveRecord::Migration[6.0]
  def change
    change_column :workers, :seniority, :date
  end
end

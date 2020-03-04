class ChangeColumnTypeSeniorityAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :workers, :seniority, :string
  end
end

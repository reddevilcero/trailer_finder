class ChangeColumnNameTrailerNumberToIdentifier < ActiveRecord::Migration[5.2]
  def change
    rename_column :trailers, :trailer_number, :identifier
  end
end

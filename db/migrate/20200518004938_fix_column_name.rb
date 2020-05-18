class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :listings, :ISBN, :isbn
  end
end

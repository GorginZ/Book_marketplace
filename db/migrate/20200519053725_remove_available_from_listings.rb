class RemoveAvailableFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :available, :boolean
    remove_column :listings, :visible, :boolean
    add_column :listings, :available, :boolean, default: true

  end
end

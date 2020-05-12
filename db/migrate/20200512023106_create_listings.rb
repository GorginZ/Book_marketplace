class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.bigint :ISBN
      t.string :author
      t.string :category
      t.string :keywords
      t.boolean :available
      t.boolean :visible

      t.timestamps
    end
  end
end

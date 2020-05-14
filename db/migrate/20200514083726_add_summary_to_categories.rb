class AddSummaryToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :summary, :text
  end
end

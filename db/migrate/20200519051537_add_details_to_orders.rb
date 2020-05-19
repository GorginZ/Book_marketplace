class AddDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :user, null: false, foreign_key: true
    add_reference :orders, :listing, null: false, foreign_key: true
  end
end

class AddCartToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :order_cart_id, :integer
  end
end

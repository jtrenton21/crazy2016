class AddOrderToPayment < ActiveRecord::Migration
  def change
  	add_column :payments, :order_cart_id, :integer
  end
end

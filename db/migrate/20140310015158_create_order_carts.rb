class CreateOrderCarts < ActiveRecord::Migration
  def change
    create_table :order_carts do |t|
      t.datetime :purchased_at

      t.timestamps
    end
  end
end

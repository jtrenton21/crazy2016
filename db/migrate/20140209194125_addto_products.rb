class AddtoProducts < ActiveRecord::Migration
  def up
  add_column :products, :payment_id, :integer
  
  end

  def down
  	remove_column :products, :payment_id
  end
end

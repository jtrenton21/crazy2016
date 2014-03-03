class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :amount, :precision => 10, :scale => 0
      t.string :status
      t.references :ticket

      t.timestamps
    end
    add_index :orders, :ticket_id
  end
end

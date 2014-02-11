class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :token
      t.string :indentifier
      t.string :payer_id

      t.timestamps
    end
  end
end

class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount, :default => 1
      t.string :token
      t.string :identifier
      t.string :payer_id
      t.boolean :recurring, :default => false
      t.boolean :digital, :default => true
      t.boolean :popup, :default => false
      t.boolean :completed, :default => false
      t.boolean :canceled, :default => false

      t.timestamps
    end
  end
end

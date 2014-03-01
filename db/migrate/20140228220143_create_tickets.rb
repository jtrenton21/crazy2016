class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :event
      t.string :date
      t.string :time
      t.decimal :price
      t.string :description
      t.references :event

      t.timestamps
    end
    add_index :tickets, :event_id
  end
end

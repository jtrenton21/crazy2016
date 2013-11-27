class CreateEventdays < ActiveRecord::Migration
  def change
    create_table :eventdays do |t|
      t.string :day

      t.timestamps
    end
  end
end

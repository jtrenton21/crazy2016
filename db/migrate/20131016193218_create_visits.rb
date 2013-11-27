class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :location
      t.string :vdate

      t.timestamps
    end
  end
end

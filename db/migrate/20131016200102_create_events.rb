class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :einfo
      t.time :start_time
      t.string :address
      t.date :weekday
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

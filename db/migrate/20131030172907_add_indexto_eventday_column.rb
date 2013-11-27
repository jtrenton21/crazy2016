class AddIndextoEventdayColumn < ActiveRecord::Migration
  def change
  	add_index :events, :eventday_id
  end
end

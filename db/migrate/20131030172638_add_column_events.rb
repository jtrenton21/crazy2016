class AddColumnEvents < ActiveRecord::Migration
  def change
  	add_column :events, :eventday_id, :integer
  end
end

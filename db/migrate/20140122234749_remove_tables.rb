class RemoveTables < ActiveRecord::Migration
  def change
  	drop_table :moderations
  end

  
end

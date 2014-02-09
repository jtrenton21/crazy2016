class RemoveTables < ActiveRecord::Migration
  def change
  	drop_table :link_preview_parsers
  	drop_table :migrations
  	drop_table :orders
  	drop_table :payments
  end
end

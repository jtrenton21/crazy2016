class AddFieldToContent < ActiveRecord::Migration
  def change
  
  add_column :contents, :approved, :boolean, :default => false

  end
end

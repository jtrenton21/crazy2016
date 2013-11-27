class EventdayAddColumns < ActiveRecord::Migration
  def change
  add_column :eventdays, :month, :string
  add_column :eventdays, :year, :string
  add_column :eventdays, :date, :string
  end
end

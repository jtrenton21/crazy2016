class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :photo

      t.timestamps
    end
  end
end

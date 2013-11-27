class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :author
      t.text :info
      t.string :source
      t.string :photo
      t.references :visit

      t.timestamps
    end
    add_index :contents, :visit_id
  end
end

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :published
      t.string :photo
      t.string :link

      t.timestamps
    end
  end
end

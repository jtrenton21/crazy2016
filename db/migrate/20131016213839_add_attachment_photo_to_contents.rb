class AddAttachmentPhotoToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :contents, :photo
  end
end

class AddAttachmentImageToProperties < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :properties, :image
  end
end

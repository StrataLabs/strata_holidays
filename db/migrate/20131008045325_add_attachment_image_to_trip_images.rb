class AddAttachmentImageToTripImages < ActiveRecord::Migration
  def self.up
    change_table :trip_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :trip_images, :image
  end
end

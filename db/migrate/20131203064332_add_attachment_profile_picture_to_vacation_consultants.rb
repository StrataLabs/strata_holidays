class AddAttachmentProfilePictureToVacationConsultants < ActiveRecord::Migration
  def self.up
    change_table :vacation_consultants do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    drop_attached_file :vacation_consultants, :profile_picture
  end
end

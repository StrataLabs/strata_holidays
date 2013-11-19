class AddUserIdToVcRegistration < ActiveRecord::Migration
  def change
    add_column :vc_registrations, :user_id, :integer
  end
end

class AddStatusToVcRegistration < ActiveRecord::Migration
  def change
    add_column :vc_registrations, :status , :string , :default => 'New'
  end
end

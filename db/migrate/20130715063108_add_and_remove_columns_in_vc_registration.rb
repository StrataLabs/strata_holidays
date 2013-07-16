class AddAndRemoveColumnsInVcRegistration < ActiveRecord::Migration
  def change
    remove_column :vc_registrations, :address
    add_column :vc_registrations, :address_1, :string
    add_column :vc_registrations, :address_2, :string
  end
end

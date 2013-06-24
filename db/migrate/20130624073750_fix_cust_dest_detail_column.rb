class FixCustDestDetailColumn < ActiveRecord::Migration
  def change
    rename_column :iti_cust_dest_details, :dest_iti_detail, :dest_iti_detail_id
  end
end

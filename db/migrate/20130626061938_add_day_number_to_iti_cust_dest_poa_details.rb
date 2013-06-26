class AddDayNumberToItiCustDestPoaDetails < ActiveRecord::Migration
  def change
    add_column :iti_cust_dest_poa_details, :day_number, :integer
  end
end

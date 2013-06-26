class CreateItiCustDestPoaDetails < ActiveRecord::Migration
  def change
    create_table :iti_cust_dest_poa_details do |t|
      t.integer :cust_iti_detail_id
      t.integer :dest_iti_detail_id
      t.integer :points_of_attraction_id
      t.time :preferred_time_of_arrival
      t.time :preferred_time_of_departure
      t.string :comments

      t.timestamps
    end
  end
end

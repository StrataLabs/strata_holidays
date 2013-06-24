class CreateCustItiDetails < ActiveRecord::Migration
  def change
    create_table :cust_iti_details do |t|
      t.integer :cust_iti_header_id
      t.integer :destination_id
      t.integer :destination_group_id
      t.date :dest_start_date
      t.date :dest_end_date
      t.integer :property_id

      t.timestamps
    end
  end
end

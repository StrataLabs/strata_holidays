class CreateCustItiRequests < ActiveRecord::Migration
  def change
    create_table :cust_iti_requests do |t|
      t.integer :customer_id
      t.string :dest_type
      t.string :destinations
      t.integer :vacation_type_id
      t.date :start_date
      t.date :end_date
      t.integer :no_of_adults
      t.integer :no_of_children

      t.timestamps
    end
  end
end

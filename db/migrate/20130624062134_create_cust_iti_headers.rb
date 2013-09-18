class CreateCustItiHeaders < ActiveRecord::Migration
  def change
    create_table :cust_iti_headers do |t|
      t.string :cust_iti_name
      t.string :iti_type
      t.integer :vacation_type_id
      t.date :trip_start_date
      t.date :trip_end_date
      t.string :seasons
      t.integer :duration
      t.integer :no_of_adults
      t.integer :no_of_children

      t.timestamps
    end
  end
end

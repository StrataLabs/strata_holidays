class CreateDestItiDetails < ActiveRecord::Migration
  def change
    create_table :dest_iti_details do |t|
      t.integer :dest_iti_header_id
      t.integer :day_number
      t.integer :points_of_attraction_id
      t.string :comments

      t.timestamps
    end
  end
end

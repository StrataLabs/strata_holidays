class CreateDestItiHeaders < ActiveRecord::Migration
  def change
    create_table :dest_iti_headers do |t|
      t.string :dest_iti_name
      t.integer :destination_id
      t.integer :day_number

      t.timestamps
    end
  end
end

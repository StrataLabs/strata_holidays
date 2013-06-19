class CreateItiDestinationXrefs < ActiveRecord::Migration
  def change
    create_table :iti_destination_xrefs do |t|
      t.integer :iti_header_id
      t.integer :destination_id
      t.integer :destination_group_id
      t.date :dest_start_date
      t.date :dest_end_date
      t.string :season
      t.integer :duration
      t.integer :no_of_people

      t.timestamps
    end
  end
end

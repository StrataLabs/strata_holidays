class RemoveDayNumberFromDestItiDetails < ActiveRecord::Migration
  def change
    remove_column :dest_iti_details, :day_number
  end
end

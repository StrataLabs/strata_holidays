class CreateItiDayDetails < ActiveRecord::Migration
  def change
    create_table :iti_day_details do |t|
      t.integer :iti_header_id
      t.integer :day_number
      t.integer :points_of_attraction_id
      t.time :start_time
      t.time :end_time
      t.string :comments

      t.timestamps
    end
  end
end

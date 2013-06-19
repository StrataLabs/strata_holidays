class CreateItiDetails < ActiveRecord::Migration
  def change
    create_table :iti_details do |t|
      t.integer :iti_header_id
      t.integer :destination_id
      t.integer :day_number
      t.integer :property_id
      t.date :iti_date

      t.timestamps
    end
  end
end

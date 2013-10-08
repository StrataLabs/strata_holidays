class CreateTripImages < ActiveRecord::Migration
  def change
    create_table :trip_images do |t|
      t.string :caption
      t.integer :cust_iti_header_id

      t.timestamps
    end
  end
end

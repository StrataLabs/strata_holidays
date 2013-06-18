class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :destination_id
      t.string :name
      t.string :property_type
      t.string :official_rating
      t.string :customer_rating
      t.boolean :restaurant
      t.boolean :pool
      t.boolean :fun_zone
      t.string :comments

      t.timestamps
    end
  end
end

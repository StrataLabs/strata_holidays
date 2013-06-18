class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :destination_id
      t.string :name
      t.string :type
      t.string :official_rating
      t.string :customer_rating
      t.boolean :restaurent
      t.boolean :pool
      t.boolean :funzoze
      t.string :comments

      t.timestamps
    end
  end
end

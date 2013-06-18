class CreatePointsOfAttractions < ActiveRecord::Migration
  def change
    create_table :points_of_attractions do |t|
      t.integer :destination_id
      t.integer :poa_type_id
      t.string :name
      t.string :comments

      t.timestamps
    end
  end
end

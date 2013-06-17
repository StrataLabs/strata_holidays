class CreatePointsOfAttractions < ActiveRecord::Migration
  def change
    create_table :points_of_attractions do |t|
      t.string :name
      t.integer :type
      t.string :comments

      t.timestamps
    end
  end
end

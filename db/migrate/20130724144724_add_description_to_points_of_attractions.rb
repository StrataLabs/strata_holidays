class AddDescriptionToPointsOfAttractions < ActiveRecord::Migration
  def change
    add_column :points_of_attractions, :description, :text
  end
end

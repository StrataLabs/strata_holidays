class AddImageToPointsOfAttraction < ActiveRecord::Migration
  def change
    add_attachment :points_of_attractions, :image
  end
end

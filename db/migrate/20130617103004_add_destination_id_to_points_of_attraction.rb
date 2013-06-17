class AddDestinationIdToPointsOfAttraction < ActiveRecord::Migration
  def change
    add_column :points_of_attractions, :destination_id, :integer
  end
end

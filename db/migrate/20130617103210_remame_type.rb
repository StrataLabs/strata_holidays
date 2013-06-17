class RemameType < ActiveRecord::Migration
  def change
  	rename_column :points_of_attractions, :type, :type_id
  end
end

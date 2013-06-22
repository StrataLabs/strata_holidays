class EditPoa < ActiveRecord::Migration
  def change
    add_column :points_of_attractions, :preferred_start_time, :time
    add_column :points_of_attractions, :preferred_end_time, :time
  end
end

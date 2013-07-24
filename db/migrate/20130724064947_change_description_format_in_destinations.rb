class ChangeDescriptionFormatInDestinations < ActiveRecord::Migration
  def change
    change_column :destinations, :description, :text
  end
end

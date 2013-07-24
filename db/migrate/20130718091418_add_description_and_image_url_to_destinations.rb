class AddDescriptionAndImageUrlToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :description, :string
  end
end

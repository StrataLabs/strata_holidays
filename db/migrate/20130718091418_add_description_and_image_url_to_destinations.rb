class AddDescriptionAndImageUrlToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :description, :string
    add_column :destinations, :image_url, :string
  end
end

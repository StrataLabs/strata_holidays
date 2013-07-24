class AddImageToDestinations < ActiveRecord::Migration
  def change
    add_attachment :destinations, :image
  end
end

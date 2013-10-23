class CreateWishListItems < ActiveRecord::Migration
  def change
    create_table :wish_list_items do |t|
      t.integer :customer_id
      t.integer :destination_id

      t.timestamps
    end
  end
end

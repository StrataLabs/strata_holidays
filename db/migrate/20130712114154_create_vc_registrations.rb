class CreateVcRegistrations < ActiveRecord::Migration
  def change
    create_table :vc_registrations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :preferred_neighborhood
      t.boolean :planning
      t.boolean :booking
      t.string :preferred_locations
      t.string :lphone
      t.string :mphone
      t.string :email
      t.string :comments
      t.string :country

      t.timestamps
    end
  end
end

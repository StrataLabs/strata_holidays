class AddAdditionalColumnsToVc < ActiveRecord::Migration
  def change
    add_column :vacation_consultants, :preferred_neighborhood, :string
    add_column :vacation_consultants, :preferred_locations, :string
    add_column :vacation_consultants, :planning, :boolean
    add_column :vacation_consultants, :booking, :boolean
  end
end


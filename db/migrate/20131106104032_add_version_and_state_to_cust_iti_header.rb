class AddVersionAndStateToCustItiHeader < ActiveRecord::Migration
  def change
    add_column :cust_iti_headers, :version, :integer
    add_column :cust_iti_headers, :state, :string
  end
end

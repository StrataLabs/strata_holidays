class AddCustomerIdToCustItiHeader < ActiveRecord::Migration
  def change
    add_column :cust_iti_headers, :customer_id, :integer
  end
end

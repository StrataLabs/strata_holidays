class AddCustItiReqIdToCustItiHeader < ActiveRecord::Migration
  def change
    add_column :cust_iti_headers, :cust_iti_request_id, :integer
  end
end

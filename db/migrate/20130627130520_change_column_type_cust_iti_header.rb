class ChangeColumnTypeCustItiHeader < ActiveRecord::Migration
  def change
    change_column :cust_iti_headers, :no_of_children, :integer
  end
end

class AddVacationConsultantIdToCustItiHeader < ActiveRecord::Migration
  def change
    add_column :cust_iti_headers, :vacation_consultant_id, :integer
  end
end

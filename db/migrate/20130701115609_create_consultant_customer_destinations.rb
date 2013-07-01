class CreateConsultantCustomerDestinations < ActiveRecord::Migration
  def change
    create_table :consultant_customer_destinations do |t|
      t.integer :vacation_consultant_id
      t.integer :customer_id
      t.integer :cust_iti_header_id

      t.timestamps
    end
  end
end

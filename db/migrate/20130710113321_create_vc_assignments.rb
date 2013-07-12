class CreateVcAssignments < ActiveRecord::Migration
  def change
    create_table :vc_assignments do |t|
      t.integer :vacation_consultant_id
      t.integer :cust_iti_request_id
      t.string :status

      t.timestamps
    end
  end
end

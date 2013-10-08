class CreateCustomerFeedbacks < ActiveRecord::Migration
  def change
    create_table :customer_feedbacks do |t|
      t.integer :cust_iti_detail_id
      t.text :positive_comments
      t.text :negative_comments
      t.text :suggestions

      t.timestamps
    end
  end
end

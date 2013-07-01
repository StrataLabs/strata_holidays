class CustItiHeader < ActiveRecord::Base
  belongs_to :vacation_type
  has_many :cust_iti_details

  validates_presence_of self.column_names - ["id"] - ["created_at"] - ["updated_at"]
end

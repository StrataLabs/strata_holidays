class ItiCustDestPoaDetail < ActiveRecord::Base
  belongs_to :cust_iti_detail
  belongs_to :dest_iti_detail
  belongs_to :points_of_attraction

  validates_presence_of self.column_names - ["id"] - ["created_at"] - ["updated_at"]
end

class ItiCustDestPoaDetail < ActiveRecord::Base
  belongs_to :cust_iti_detail
  belongs_to :dest_iti_detail
  belongs_to :points_of_attraction

  validates_presence_of ["cust_iti_detail_id", "dest_iti_detail_id", "points_of_attraction_id", "preferred_time_of_arrival", "preferred_time_of_departure", "day_number"]
end

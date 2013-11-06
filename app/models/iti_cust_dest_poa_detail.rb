class ItiCustDestPoaDetail < ActiveRecord::Base
  belongs_to :cust_iti_detail
  belongs_to :dest_iti_detail
  belongs_to :points_of_attraction
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates_presence_of ["points_of_attraction_id", "preferred_time_of_arrival", "preferred_time_of_departure", "day_number"]
end

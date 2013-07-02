class CustItiHeader < ActiveRecord::Base
  belongs_to :vacation_type
  has_many :cust_iti_details

  validates_presence_of ["cust_iti_name", "iti_type", "vacation_type_id", "trip_start_date", "trip_end_date", "seasons", "duration", "no_of_adults", "no_of_children"]
end

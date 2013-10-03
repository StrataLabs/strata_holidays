class CustItiRequest < ActiveRecord::Base
  has_many :vc_assignments
  belongs_to :customer
  serialize :destinations
  belongs_to :vacation_type
  validates_presence_of ["dest_type", "destinations", "vacation_type_id", "no_of_adults", "start_date", "end_date"]
  #"customer_id",
end
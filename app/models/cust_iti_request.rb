class CustItiRequest < ActiveRecord::Base
  has_many :vc_assignments
  belongs_to :customer
  serialize :destinations
  belongs_to :vacation_type
  validates_presence_of ["customer_id", "dest_type", "destinations", "vacation_type_id", "start_date", "end_date", "no_of_adults"]
end

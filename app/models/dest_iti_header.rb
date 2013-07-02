class DestItiHeader < ActiveRecord::Base
  belongs_to :destination
  has_many :dest_iti_details
  validates_presence_of ["dest_iti_name", "destination_id", "day_number"]
end

class DestItiHeader < ActiveRecord::Base
  belongs_to :destination
  has_many :dest_iti_details
end

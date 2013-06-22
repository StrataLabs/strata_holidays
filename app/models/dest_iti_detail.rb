class DestItiDetail < ActiveRecord::Base
  belongs_to :dest_iti_header
  belongs_to :points_of_attraction
end

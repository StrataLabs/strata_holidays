class DestItiDetail < ActiveRecord::Base
  belongs_to :dest_iti_header
  belongs_to :points_of_attraction
  validates_presence_of :dest_iti_header_id, :points_of_attraction_id
end

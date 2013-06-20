class ItiDestinationXref < ActiveRecord::Base
  belongs_to :iti_header
  belongs_to :destination
  validates_presence_of :iti_header_id, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :season, :duration, :no_of_people
end

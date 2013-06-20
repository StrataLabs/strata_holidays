class ItiDayDetail < ActiveRecord::Base
  belongs_to :iti_header
  belongs_to :points_of_attraction
  validates_presence_of :iti_header_id, :day_number, :points_of_attraction_id, :start_time, :end_time
end

class ItiDayDetail < ActiveRecord::Base
  belongs_to :iti_header
  belongs_to :points_of_attraction
end

class PointsOfAttraction < ActiveRecord::Base
  belongs_to :destination
  belongs_to :poa_type
end

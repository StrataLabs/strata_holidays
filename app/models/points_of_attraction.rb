class PointsOfAttraction < ActiveRecord::Base
  belongs_to :destination
  belongs_to :poa_type

  validates_presence_of :destination_id, :poa_type_id, :name
  validates :name, length: {minimum:3, maximum: 80}
end

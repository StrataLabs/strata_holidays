class Destination < ActiveRecord::Base
  has_many :points_of_attractions
  has_many :dest_iti_headers
  validates :name, presence: true, length: {minimum:3, maximum: 80}
  validates_presence_of :description
end

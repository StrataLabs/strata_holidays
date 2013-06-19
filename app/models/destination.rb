class Destination < ActiveRecord::Base
  has_many :points_of_attractions
  validates :name, presence: true, length: {minimum:3, maximum: 80}
end

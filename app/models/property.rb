class Property < ActiveRecord::Base
  belongs_to :destination
  validates_presence_of :destination_id, :name, :property_type, :official_rating, :customer_rating
  validates :name, length: {minimum:3, maximum: 80}
end

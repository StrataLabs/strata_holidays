class ItiDetail < ActiveRecord::Base
  validates_presence_of :iti_header_id, :destination_id, :day_number, :property_id, :iti_date
  belongs_to :iti_header
  belongs_to :destination
  belongs_to :property
end

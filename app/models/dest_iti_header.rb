class DestItiHeader < ActiveRecord::Base
  belongs_to :destination
  has_many :dest_iti_details
  validates_presence_of self.column_names - ["id"] - ["created_at"] - ["updated_at"]
end

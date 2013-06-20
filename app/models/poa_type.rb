class PoaType < ActiveRecord::Base
  validates_presence_of :poa_type, :time_can_be_spent
  validates :poa_type, length: {minimum:3, maximum: 80}
end

class PoaType < ActiveRecord::Base
  validates_presence_of :description, :time_can_be_spent
  validates :description, length: {minimum:3, maximum: 80}
end

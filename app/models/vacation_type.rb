class VacationType < ActiveRecord::Base
  validates_presence_of :vac_type
  validates :vac_type, presence: true, length: {minimum:3, maximum: 80}
end

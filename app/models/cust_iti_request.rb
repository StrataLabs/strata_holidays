class CustItiRequest < ActiveRecord::Base
  has_many :vc_assignments
  serialize :destinations
  belongs_to :vacation_type
end

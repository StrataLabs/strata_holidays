class CustItiRequest < ActiveRecord::Base
  has_many :vc_assignments
  belongs_to :customer
  serialize :destinations
  belongs_to :vacation_type

end

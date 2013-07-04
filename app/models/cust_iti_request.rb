class CustItiRequest < ActiveRecord::Base
  serialize :destinations
  belongs_to :vacation_type
end

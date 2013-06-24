class ItiCustDestDetail < ActiveRecord::Base
  belongs_to :cust_iti_detail
  belongs_to :dest_iti_detail
end

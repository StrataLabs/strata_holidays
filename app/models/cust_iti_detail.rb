class CustItiDetail < ActiveRecord::Base
  belongs_to :cust_iti_header
  belongs_to :destination
  belongs_to :property
end

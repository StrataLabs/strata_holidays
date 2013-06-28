class CustItiDetail < ActiveRecord::Base
  belongs_to :cust_iti_header
  belongs_to :destination
  belongs_to :property
  has_many :iti_cust_dest_poa_details
end

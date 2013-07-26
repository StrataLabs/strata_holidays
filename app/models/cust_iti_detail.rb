class CustItiDetail < ActiveRecord::Base
  belongs_to :cust_iti_header
  belongs_to :destination
  belongs_to :property
  has_many :iti_cust_dest_poa_details
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates_presence_of ["cust_iti_header_id", "destination_id", "destination_group_id", "dest_start_date", "dest_end_date", "property_id"]
end

class CustItiDetail < ActiveRecord::Base
  belongs_to :cust_iti_header
  belongs_to :destination
  belongs_to :property
  has_many :iti_cust_dest_poa_details, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_one :customer_feedback
  accepts_nested_attributes_for :iti_cust_dest_poa_details, :allow_destroy => true
  validates_presence_of ["destination_id", "destination_group_id", "dest_start_date", "dest_end_date", "property_id"]
end

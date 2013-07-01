class ConsultantCustomerDestination < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vacation_consultant
  belongs_to :cust_iti_header

  validates_presence_of :customer_id, :vacation_consultant_id, :cust_iti_header_id
end

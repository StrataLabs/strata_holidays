class VcAssignment < ActiveRecord::Base
  belongs_to :vacation_consultant
  belongs_to :cust_iti_request
  validates_presence_of :vacation_consultant_id, :cust_iti_request_id, :status
end

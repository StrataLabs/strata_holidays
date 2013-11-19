class CustomerNewRequestConfirmationJob < Struct.new(:vc_ids, :cust_req_id)
  def perform
    CustomersMailer.new_request_confirmation(vc_ids, cust_req_id).deliver
  end
end
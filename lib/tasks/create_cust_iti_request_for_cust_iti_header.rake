desc "Create corresponding requests for headers"
task :create_request_for_header => :environment do
  hdrs = CustItiHeader.all
  hdrs.each do |h|
    req = CustItiRequest.new
    req.customer_id = h.customer_id
    dests = []
    h.cust_iti_details.each do |d|
      dests << d.destination_id.to_s
    end
    req.destinations = dests
    h.cust_iti_request = req
    req.save(:validate => false)
    req.reload
    h.cust_iti_request_id = req.id
    h.save(:validate => false)
  end
end

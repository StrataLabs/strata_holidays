json.array!(@cust_iti_requests) do |cust_iti_request|
  json.extract! cust_iti_request, :customer_id, :dest_type, :destinations, :vacation_type_id, :start_date, :end_date, :no_of_adults, :no_of_children
  json.url cust_iti_request_url(cust_iti_request, format: :json)
end
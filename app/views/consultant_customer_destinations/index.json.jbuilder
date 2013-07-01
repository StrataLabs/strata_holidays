json.array!(@consultant_customer_destinations) do |consultant_customer_destination|
  json.extract! consultant_customer_destination, :vacation_consultant_id, :customer_id, :cust_iti_header_id
  json.url consultant_customer_destination_url(consultant_customer_destination, format: :json)
end
json.array!(@iti_cust_dest_details) do |iti_cust_dest_detail|
  json.extract! iti_cust_dest_detail, :cust_iti_detail_id, :dest_iti_detail, :preferred_time_of_arrival, :preferred_time_of_departure, :comments
  json.url iti_cust_dest_detail_url(iti_cust_dest_detail, format: :json)
end
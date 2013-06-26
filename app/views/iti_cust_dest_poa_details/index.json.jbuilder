json.array!(@iti_cust_dest_poa_details) do |iti_cust_dest_poa_detail|
  json.extract! iti_cust_dest_poa_detail, :cust_iti_detail_id, :dest_iti_detail_id, :points_of_attraction_id, :preferred_time_of_arrival, :preferred_time_of_departure, :comments
  json.url iti_cust_dest_poa_detail_url(iti_cust_dest_poa_detail, format: :json)
end
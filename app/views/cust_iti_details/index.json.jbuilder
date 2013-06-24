json.array!(@cust_iti_details) do |cust_iti_detail|
  json.extract! cust_iti_detail, :cust_iti_header_id, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :property_id
  json.url cust_iti_detail_url(cust_iti_detail, format: :json)
end
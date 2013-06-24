json.array!(@cust_iti_headers) do |cust_iti_header|
  json.extract! cust_iti_header, :cust_iti_name, :iti_type, :vacation_type_id, :trip_start_date, :trip_end_date, :seasons, :duration, :no_of_adults, :no_of_children
  json.url cust_iti_header_url(cust_iti_header, format: :json)
end
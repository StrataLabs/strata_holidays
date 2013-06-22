json.array!(@dest_iti_headers) do |dest_iti_header|
  json.extract! dest_iti_header, :dest_iti_name, :destination_id, :day_number
  json.url dest_iti_header_url(dest_iti_header, format: :json)
end
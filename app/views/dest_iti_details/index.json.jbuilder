json.array!(@dest_iti_details) do |dest_iti_detail|
  json.extract! dest_iti_detail, :dest_iti_header_id, :day_number, :points_of_attraction_id, :comments
  json.url dest_iti_detail_url(dest_iti_detail, format: :json)
end
json.array!(@iti_day_details) do |iti_day_detail|
  json.extract! iti_day_detail, :iti_header_id, :day_number, :points_of_attraction_id, :start_time, :end_time, :comments
  json.url iti_day_detail_url(iti_day_detail, format: :json)
end
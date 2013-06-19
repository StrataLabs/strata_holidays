json.array!(@iti_headers) do |iti_header|
  json.extract! iti_header, :name, :iti_type, :vacation_type_id, :iti_start_date, :iti_end_date, :season, :duration, :no_of_people
  json.url iti_header_url(iti_header, format: :json)
end
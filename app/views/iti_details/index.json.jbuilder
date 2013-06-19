json.array!(@iti_details) do |iti_detail|
  json.extract! iti_detail, :iti_header_id, :destination_id, :day_number, :property_id, :iti_date
  json.url iti_detail_url(iti_detail, format: :json)
end
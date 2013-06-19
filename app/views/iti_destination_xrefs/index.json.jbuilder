json.array!(@iti_destination_xrefs) do |iti_destination_xref|
  json.extract! iti_destination_xref, :iti_header_id, :destination_id, :destination_group_id, :dest_start_date, :dest_end_date, :season, :duration, :no_of_people
  json.url iti_destination_xref_url(iti_destination_xref, format: :json)
end
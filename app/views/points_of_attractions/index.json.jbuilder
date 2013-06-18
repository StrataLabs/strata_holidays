json.array!(@points_of_attractions) do |points_of_attraction|
  json.extract! points_of_attraction, :destination_id, :poa_type_id, :name, :comments
  json.url points_of_attraction_url(points_of_attraction, format: :json)
end
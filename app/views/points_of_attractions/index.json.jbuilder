json.array!(@points_of_attractions) do |points_of_attraction|
  json.extract! points_of_attraction, :name, :type, :comments
  json.url points_of_attraction_url(points_of_attraction, format: :json)
end
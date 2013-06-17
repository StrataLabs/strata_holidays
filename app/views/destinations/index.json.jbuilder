json.array!(@destinations) do |destination|
  json.extract! destination, :name
  json.url destination_url(destination, format: :json)
end
json.array!(@properties) do |property|
  json.extract! property, :destination_id, :name, :property_type, :official_rating, :customer_rating, :restaurant, :pool, :fun_zone, :comments
  json.url property_url(property, format: :json)
end
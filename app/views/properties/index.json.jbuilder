json.array!(@properties) do |property|
  json.extract! property, :destination_id, :name, :type, :official_rating, :customer_rating, :pool, :funzone, :restaurent, :comments
  json.url property_url(property, format: :json)
end
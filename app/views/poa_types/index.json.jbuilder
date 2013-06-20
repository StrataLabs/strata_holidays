json.array!(@poa_types) do |poa_type|
  json.extract! poa_type, :poa_type, :time_can_be_spent, :comments
  json.url poa_type_url(poa_type, format: :json)
end
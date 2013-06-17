json.array!(@poa_types) do |poa_type|
  json.extract! poa_type, :type, :description, :meant_fof, :time_can_be_spent, :comments
  json.url poa_type_url(poa_type, format: :json)
end
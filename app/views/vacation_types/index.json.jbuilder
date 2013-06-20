json.array!(@vacation_types) do |vacation_type|
  json.extract! vacation_type, :vac_type
  json.url vacation_type_url(vacation_type, format: :json)
end
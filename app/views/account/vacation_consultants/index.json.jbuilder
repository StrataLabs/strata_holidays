json.array!(@vacation_consultants) do |vacation_consultant|
  json.extract! vacation_consultant, :name, :address_1, :address_2, :city, :state, :country, :lphone, :mphone, :email, :comments
  json.url vacation_consultant_url(vacation_consultant, format: :json)
end
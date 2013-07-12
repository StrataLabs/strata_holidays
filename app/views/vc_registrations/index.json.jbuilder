json.array!(@vc_registrations) do |vc_registration|
  json.extract! vc_registration, :name, :address, :city, :state, :preferred_neighborhood, :planning, :booking, :preferred_locations, :lphone, :mphone, :email, :comments, :country
  json.url vc_registration_url(vc_registration, format: :json)
end
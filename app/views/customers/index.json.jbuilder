json.array!(@customers) do |customer|
  json.extract! customer, :name, :address_1, :address_2, :city, :state, :country, :lphone, :mphone, :email, :comments
  json.url customer_url(customer, format: :json)
end
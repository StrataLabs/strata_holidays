StrataHolidays::Application.routes.draw do  devise_for :users
  resources :cust_iti_requests
  resources :consultant_customer_destinations
  resources :vacation_consultants
  resources :customers
  resources :iti_cust_dest_poa_details
  resources :iti_cust_dest_details
  resources :cust_iti_details
  resources :cust_iti_headers
  resources :dest_iti_details
  resources :dest_iti_headers
  resources :unwinders do
    collection do
      get 'child'
      get 'home'
      get 'user'
    end
  end

  post '/search_vcs' => 'vacation_consultants#search'
  resources :vacation_types
  resources :iti_day_details
  resources :iti_details
  resources :iti_destination_xrefs
  resources :iti_headers
  resources :properties
  resources :points_of_attractions
  resources :destinations
  resources :poa_types
  root 'home#index'
end


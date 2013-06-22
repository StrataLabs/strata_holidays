StrataHolidays::Application.routes.draw do  devise_for :users
  resources :dest_iti_details
  resources :dest_iti_headers
  resources :unwinders
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


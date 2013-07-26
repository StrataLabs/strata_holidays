StrataHolidays::Application.routes.draw do  devise_for :users

  get 'itinerary' => 'static_pages#itinerary'
  resources :vc_registrations
  resources :cust_iti_requests
  resources :consultant_customer_destinations
  resources :vacation_consultants
  resources :customers
  resources :iti_cust_dest_poa_details do
    resources :comments
  end
  resources :iti_cust_dest_details
  resources :cust_iti_details do
    resources :comments
  end

  resources :cust_iti_headers do
    member do
      get 'history'
    end
  end
  resources :dest_iti_details
  resources :dest_iti_headers
  resources :unwinders do
    collection do
      get 'child'
      get 'home'
      get 'user'
    end
  end

  get 'get_cust_iti_request' => 'cust_iti_requests#get_cust_iti_request', :as => 'get_cust_iti_request'
  get 'unwinders/vacation_consultant/:id' , to: 'unwinders#vacation_consultant', :as => 'vc_unwinders'
  post '/assign-vcs' => 'vacation_consultants#assign_vcs'
  # post '/search_vcs' => 'vacation_consultants#search_vcs', :as => 'search_vcs'
  # post '/search_vcs_form' => 'vacation_consultants#search', :as => 'display_vcs'
  get 'edit_vc_assignment' => 'vacation_consultants#edit_vc_assignment'
  get 'create_vc' => 'vacation_consultants#create_vc'
  get '/search_vcs' => 'vacation_consultants#search_vcs'
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


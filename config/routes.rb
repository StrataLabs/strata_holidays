StrataHolidays::Application.routes.draw do
  get "/search" => "search#custom_search"
  resources :testimonials
  resources :campaigns do
    member do
      post 'promotion_mail'
      post 'import_email_ids'
    end
  end
  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" } do
    get '/users/sign_out' => 'users/sessions#destroy'
  end

  get '/choose_role' => 'static_pages#choose_role'
  post '/set_role' => 'static_pages#set_role'
  get 'itinerary' => 'static_pages#itinerary'
  get 'admin' => 'static_pages#admin'
  resources :vc_registrations
  resources :wish_list_items

  get '/remove_from_wishlist' => 'wish_list_items#destroy'
  get '/show_requests_cart' => "wish_list_items#show_cart", defaults: {format: "js"}
  get '/request_from_cart' => "cust_iti_requests#request_from_cart"
  resources :cust_iti_requests do
    collection do
      get :request_cart, defaults: {format: "js"}
    end
  end
  resources :consultant_customer_destinations
  resources :vacation_consultants do
    member do
      get 'my_campaigns'
    end
  end

  get '/customers/new_requests' => 'customers#new_requests'
  resources :customers do
    member do
      get 'planning_in_progress'
    end
  end
  resources :iti_cust_dest_poa_details do
    resources :comments
  end
  resources :iti_cust_dest_details
  resources :cust_iti_details do
    resources :comments
    member do
      post 'customer_feedback'
    end
  end

  resources :cust_iti_headers do
    member do
      get 'history'
      get 'publish'
      get 'customer_view'
      get 'edit_state'
      get 'earlier_versions'
      get 'rebuild_version'
      get 'revert_to_version'
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
  get 'edit_vc_assignment' => 'vacation_consultants#edit_vc_assignment'
  get 'create_vc' => 'vacation_consultants#create_vc'
  get '/search_vcs' => 'vacation_consultants#search_vcs'
  get '/show_requests_cart' => "cust_iti_requests#request_cart", defaults: {formats: "js"}
  resources :vacation_types
  resources :iti_day_details
  resources :iti_details
  resources :iti_destination_xrefs
  resources :iti_headers
  resources :properties
  resources :points_of_attractions
  resources :destinations
  resources :poa_types
  root :to => "home#index"
end


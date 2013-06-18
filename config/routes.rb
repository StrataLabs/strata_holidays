StrataHolidays::Application.routes.draw do  devise_for :users
  resources :properties  
  resources :points_of_attractions
  resources :destinations
  resources :poa_types
  root 'home#index'
end

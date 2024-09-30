Rails.application.routes.draw do

  resources :directions
  resources :buses 
  resources :trains
  resources :bookings
end

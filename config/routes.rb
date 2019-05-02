# frozen_string_literal: true

Rails.application.routes.draw do
  resources :photos
  resources :items
  resources :tripfamilies
  resources :trips
  # RESTful routes
  resources :examples, except: %i[new edit]
  # Custom routes
  get '/showitems/:id' => 'items#showitems'
  get '/showmyitems/:tripId/:userName' => 'items#showmyitems'
  patch '/items/:tripId/:itemsArray/:userName' => 'items#update_trip_items'

  get '/tripphotos/:tripId' => 'photos#show_trip_photos'

  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end

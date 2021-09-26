Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  root :to => redirect('/movies')

  # tmdb
  get '/movies/search_tmdb' => 'movies#search_tmdb'
  post '/movies/create_from_tmdb' => 'movies#create_from_tmdb', :as => :create_from_tmdb

  resources :movies
  
  # authentication
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
end

Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  resources :movies
  root :to => redirect('/movies')

  # tmdb
  post '/movies/search_tmdb' => 'movies#search_tmdb'
  post '/movies/create_from_tmdb' => 'movies#create_from_tmdb'

  # authentication
  get  'auth/twitter' => 'sessions#create'
  post  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
end
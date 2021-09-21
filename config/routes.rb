Rails.application.routes.draw do
  devise_for :users
  resources :movies
  root :to => redirect('/movies')

  # tmdb
  post '/movies/search_tmdb'

  # authentication
  get  'auth/twitter' => 'sessions#create'
  post  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
end
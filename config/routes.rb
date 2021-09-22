Rails.application.routes.draw do
  resources :movies
  root :to => redirect('/movies')

  # tmdb
  post '/movies/search_tmdb'

  # authentication
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
end
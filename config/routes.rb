Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  # tmdb
  get '/movies/search_tmdb' => 'movies#search_tmdb'
  post '/movies/create_from_tmdb' => 'movies#create_from_tmdb', :as => :create_from_tmdb

  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')

  # authentication
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
end

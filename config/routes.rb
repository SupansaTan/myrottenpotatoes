Rails.application.routes.draw do
  resources :movies
  root :to => redirect('/movies')
  get  'auth/twitter' => 'sessions#create'
  post  'auth/:provider/callback' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  get  'auth/failure' => 'sessions#failure'
end
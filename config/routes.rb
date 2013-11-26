Demap::Application.routes.draw do
  root :to => 'movies#index'

  resources :movies
  resources :reviews
end

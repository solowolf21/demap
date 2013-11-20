Demap::Application.routes.draw do
  root :to => 'movies#index'
  get 'movies' => 'movies#index'
  get 'movies/:id' => 'movies#show', :as => 'movie'
end

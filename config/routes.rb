Demap::Application.routes.draw do
  devise_for :users

  root :to => 'movies#index'

  resources :movies do
    resources :reviews
    end
end

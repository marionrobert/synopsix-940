Rails.application.routes.draw do
  get 'movies/create'
  get 'movies/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :movies, only: %i[ new create destroy]
end

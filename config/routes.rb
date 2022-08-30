Rails.application.routes.draw do
  get 'inputs/create'
  get 'player_games/new'
  get 'player_games/create'

  get 'games/new'
  get 'games/create'
  get 'games/show'


  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :player_games, only: %i[ create show ] do
    resources :inputs, only: %i[ create ]
  end

  resources :movies, only: %i[ new create destroy]

end

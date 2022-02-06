Rails.application.routes.draw do
  # get 'platforms/index'
  # get 'platforms/show'
  # get 'publishers/index'
  # get 'publishers/show'
  # get 'games/index'
  # get 'games/show'
  resources :games, only: [:index, :show]
  resources :publishers, only: [:index, :show]
  resources :platforms, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

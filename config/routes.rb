Rails.application.routes.draw do
  resources :pages
  get 'home/index'
  # get 'platforms/index'
  # get 'platforms/show'
  # get 'publishers/index'
  # get 'publishers/show'
  # get 'games/index'
  # get 'games/show'
  resources :games, only: [:index, :show]
  resources :publishers, only: [:index, :show]
  resources :platforms, only: [:index, :show]

  #default route to website as home page route
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

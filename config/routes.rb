Rails.application.routes.draw do
  # resources :pages, except: [:show]

  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  # get "/pages/:permalink", to: "pages#permalink", as: "permalink"get "/pages/:permalink", to: "pages#permalink", as: "permalink"

  get "home/index"
  # get 'platforms/index'
  # get 'platforms/show'
  # get 'publishers/index'
  # get 'publishers/show'
  # get 'games/index'
  # get 'games/show'
  resources :games, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :publishers, only: %i[index show]
  resources :platforms, only: %i[index show]
  resources :pages, except: [:show]

  # default route to website as home page route
  root to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

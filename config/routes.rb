Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "home", to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  get "/results", to: "journeys#results"
  # post "/results", to: "journeys#results"

  post "/details/:travel_mode", to: "journeys#details", as: "details"
  resources :journeys, only: [:create]


  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

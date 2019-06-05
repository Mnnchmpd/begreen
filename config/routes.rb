Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "home", to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "/results", to: "journeys#results"
  get "/details", to: "journeys#details"

  # resources :journeys, only: [:index, :update, :show, :new, :create] do
  #   collection do
  #     get :detail
  #   end


  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

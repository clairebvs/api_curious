Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/auth/:provider/callback', to: 'sessions#create'
  get "/signout", to: "sessions#destroy", as: 'signout'

  get '/dashboard', to: "users#show"
  get '/repository', to: "repositories#index"
  # get '/starred', to: "starred#index"
  get '/dashboard', to: "starred#index"
end

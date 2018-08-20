Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # get "/auth/:provider/callback", to: "sessions#create"

  # get '/auth/github', as: 'github_login'
  get '/auth/:provider/callback', to: 'sessions#create'
end

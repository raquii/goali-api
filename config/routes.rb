Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  get "/user", to: "users#show"
  delete "/logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

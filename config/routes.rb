Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/users", to: "users#index"

  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]
  resources :profiles, only: [:show, :update]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

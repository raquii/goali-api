Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  get "/users", to: "users#index"

  resources :friendships, except: [:update, :show]
  resources :friend_requests, except: [:update, :show]
  resources :profiles, only: [:show, :update]
  resources :habits, except: [:show]
  resources :logs, only: [:create, :destroy]
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

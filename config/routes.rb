Rails.application.routes.draw do
  resources :sitting_requests
  resources :animals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root to: "home#index"
  devise_for :users
end

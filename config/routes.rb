Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "users/new", to: "users#new"
  post "users", to: "users#create"
  get "users/:id", to: "users#show"
  get "users/:id/edit", to: "users#edit"
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end

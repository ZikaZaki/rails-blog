Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  get "users/new", to: "users#new"
  post "users", to: "users#create"
  get "users/:id", to: "users#show"
  get "users/:id/edit", to: "users#edit"
  patch "users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"
  
  get "users/:id/posts", to: "posts#index"
  get "users/:id/posts/new", to: "posts#new"
  post "users/:id/posts", to: "posts#create"
  get "users/:id/posts/:post_id", to: "posts#show"
  get "users/:id/posts/:post_id/edit", to: "posts#edit"
  
  # Defines the root path route ("/")
  # root "articles#index"
end

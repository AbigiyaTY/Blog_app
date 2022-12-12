Rails.application.routes.draw do
  resources :users
  resources :likes
  resources :posts
  resources :comments
  root "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/edit", to: "users#edit"
  get "/users/new", to: "users#new"
  get "/users/:id/posts", to: "users#posts"
  get "/users/:id/posts/index", to: "posts#index"
  get "/users/:id/posts/new", to: "posts#new"
  get "/users/:id/posts/:id", to: "posts#show"
  get "/users/:id/posts/:id/edit", to: "posts#edit"
  get "/users/:id/posts/:id/comments", to: "posts#comments"
  get "/users/:id/posts/:id/comments/new", to: "comments#new"
  get "/users/:id/posts/:id/comments/:id", to: "comments#show"
  get "/users/:id/posts/:id/comments/:id/edit", to: "comments#edit"
end

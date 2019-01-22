Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   "authors#index"

  get    "/login",            to: "sessions#new",     as: :login
  delete "/logout",           to: "sessions#destroy", as: :logout
  post   "/login",            to: "sessions#create"

  post   "/users/search",     to: "users#search"
  get    "/signup",           to: "users#new",        as: :signup

  get    "/authors",          to: "authors#index",    as: :authors 
  post   "/authors",          to: "authors#create"
  get    "/authors/new",      to: "authors#new",      as: :new_author
  get    "/authors/:id/edit", to: "authors#edit",     as: :edit_author 
  get    "/authors/:id",      to: "authors#show",     as: :author
  patch  "/authors/:id",      to: "authors#update"
  put    "/authors/:id",      to: "authors#update"
  delete "/authors/:id",      to: "authors#destroy"

  resources :books
  resources :users,    only: [:index, :create, :show]
  resources :comments, only: [:create, :update, :destroy]

end

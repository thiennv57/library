Rails.application.routes.draw do
  root "books#index"
  resources :books, only: [:index, :new]
  match "/books/show/:code", to: "books#show", via: "get"
  match "/books/delete/:code", to: "books#delete", via: "get"
  match "/books/edit/:code", to: "books#edit", via: "get"
end

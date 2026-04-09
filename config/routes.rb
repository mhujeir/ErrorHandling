Rails.application.routes.draw do
  get 'secure/controller_error'
  get 'secure/db_error'
  root "home#index"

  get "/demo", to: "demo#index"

  resources :items, only: [:index, :show]
  get "/search", to: "search#index"
  get "/secure/controller_error", to: "secure#controller_error"
  get "/secure/db_error", to: "secure#db_error"
  # vulnerable routes
  get "/leaks/missing_item/:id", to: "leaks#missing_item", as: :leak_missing_item
  get "/leaks/controller_error", to: "leaks#controller_error", as: :leak_controller_error
  get "/leaks/db_error", to: "leaks#db_error", as: :leak_db_error
end